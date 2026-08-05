import 'dart:typed_data';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> registerWithEmail({
    required String email,
    required String password,
    required String fullName,
  });

  Future<UserModel> loginWithEmail({required String email, required String password});

  Future<void> sendPasswordResetEmail({required String email});

  Future<void> sendPhoneOtp({required String phone});

  Future<UserModel> verifyPhoneOtp({required String phone, required String otp});

  Future<void> logout();

  Future<UserModel?> getCurrentUser();

  Future<UserModel> updateProfile({
    required String fullName,
    String? phone,
    DateTime? dateOfBirth,
  });

  Future<UserModel> updateAvatar({required Uint8List bytes, required String fileExt});

  Stream<UserModel?> get authStateChanges;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client;

  const AuthRemoteDataSourceImpl(this.client);

  /// `phone`/`date_of_birth` sütunları `profiles`-dan birbaşa oxuna bilmir
  /// (bax SUPABASE_MIGRATION_17.sql və 19.sql — başqalarının bu
  /// məlumatlarını API ilə çəkməyin qarşısını almaq üçün), ona görə ayrıca
  /// `get_my_private_fields()` RPC-si ilə yalnız cari istifadəçinin öz
  /// dəyərləri əlavə olunur. `email` isə heç vaxt `profiles`-da saxlanmır —
  /// auth sessiyasından götürülür.
  Future<UserModel> _fetchProfile(String userId, {User? authUser}) async {
    final json = await client
        .from('profiles')
        .select('id, full_name, avatar_url, role, preferred_language, is_verified')
        .eq('id', userId)
        .single();
    final privateFieldsRows = await client.rpc('get_my_private_fields') as List;
    final privateFields =
        privateFieldsRows.isNotEmpty ? privateFieldsRows.first as Map<String, dynamic> : null;
    final dobString = privateFields?['date_of_birth'] as String?;
    final resolvedAuthUser = authUser ?? client.auth.currentUser;
    return UserModel.fromJson(json).copyWith(
      phone: privateFields?['phone'] as String?,
      dateOfBirth: dobString != null ? DateTime.parse(dobString) : null,
      email: resolvedAuthUser?.email,
    );
  }

  /// `handle_new_user` trigger-i `auth.users` insert-i ilə eyni anda işə düşür,
  /// amma PostgREST-in yeni sətri görməsi arasında qısa gecikmə ola bilər —
  /// ona görə qeydiyyat/OTP-dən dərhal sonrakı ilk oxuma bir neçə dəfə təkrarlanır.
  Future<UserModel> _fetchProfileWithRetry(String userId, {User? authUser, int attempts = 4}) async {
    for (var i = 0; i < attempts; i++) {
      try {
        return await _fetchProfile(userId, authUser: authUser);
      } catch (_) {
        if (i == attempts - 1) rethrow;
        await Future.delayed(Duration(milliseconds: 300 * (i + 1)));
      }
    }
    throw const ServerException('Profil tapılmadı');
  }

  @override
  Future<UserModel> registerWithEmail({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName},
      );
      final user = response.user;
      if (user == null) throw const ServerException('Qeydiyyat uğursuz oldu');
      return _fetchProfileWithRetry(user.id, authUser: user);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserModel> loginWithEmail({required String email, required String password}) async {
    try {
      final response = await client.auth.signInWithPassword(email: email, password: password);
      final user = response.user;
      if (user == null) throw const ServerException('Giriş uğursuz oldu');
      return _fetchProfile(user.id, authUser: user);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await client.auth.resetPasswordForEmail(email);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> sendPhoneOtp({required String phone}) async {
    try {
      await client.auth.signInWithOtp(phone: phone);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserModel> verifyPhoneOtp({required String phone, required String otp}) async {
    try {
      final response = await client.auth.verifyOTP(
        phone: phone,
        token: otp,
        type: OtpType.sms,
      );
      final user = response.user;
      if (user == null) throw const ServerException('OTP təsdiqlənmədi');
      return _fetchProfileWithRetry(user.id, authUser: user);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await client.auth.signOut();
    } on AuthException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = client.auth.currentUser;
    if (user == null) return null;
    return _fetchProfile(user.id);
  }

  @override
  Future<UserModel> updateProfile({
    required String fullName,
    String? phone,
    DateTime? dateOfBirth,
  }) async {
    final userId = client.auth.currentUser?.id;
    if (userId == null) throw const UnauthorizedException();
    try {
      await client.from('profiles').update({
        'full_name': fullName,
        'phone': phone,
        'date_of_birth': dateOfBirth == null
            ? null
            : '${dateOfBirth.year.toString().padLeft(4, '0')}-'
                '${dateOfBirth.month.toString().padLeft(2, '0')}-'
                '${dateOfBirth.day.toString().padLeft(2, '0')}',
      }).eq('id', userId);
      return _fetchProfile(userId);
    } on PostgrestException catch (e) {
      if (e.code == '23505') throw const ServerException('Bu telefon nömrəsi artıq istifadə olunur');
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserModel> updateAvatar({required Uint8List bytes, required String fileExt}) async {
    final userId = client.auth.currentUser?.id;
    if (userId == null) throw const UnauthorizedException();
    try {
      final path = '$userId/avatar.$fileExt';
      await client.storage.from('avatars').uploadBinary(
            path,
            bytes,
            fileOptions: const FileOptions(upsert: true),
          );
      // Eyni path yenidən yükləndikdə URL dəyişmədiyi üçün keşi sındırmaq lazımdır.
      final publicUrl =
          '${client.storage.from('avatars').getPublicUrl(path)}?v=${DateTime.now().millisecondsSinceEpoch}';
      await client.from('profiles').update({'avatar_url': publicUrl}).eq('id', userId);
      return _fetchProfile(userId);
    } on StorageException catch (e) {
      throw ServerException(e.message);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return client.auth.onAuthStateChange.asyncMap((authState) async {
      final user = authState.session?.user;
      if (user == null) return null;
      return _fetchProfile(user.id, authUser: user);
    });
  }
}
