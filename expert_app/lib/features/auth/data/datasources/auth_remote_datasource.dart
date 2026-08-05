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

  Future<UserModel> updateProfile({required String fullName});

  Future<UserModel> updateAvatar({required Uint8List bytes, required String fileExt});

  Stream<UserModel?> get authStateChanges;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client;

  const AuthRemoteDataSourceImpl(this.client);

  Future<UserModel> _fetchProfile(String userId) async {
    final json = await client.from('profiles').select().eq('id', userId).single();
    return UserModel.fromJson(json);
  }

  /// `handle_new_user` trigger-i `auth.users` insert-i ilə eyni anda işə düşür,
  /// amma PostgREST-in yeni sətri görməsi arasında qısa gecikmə ola bilər —
  /// ona görə qeydiyyat/OTP-dən dərhal sonrakı ilk oxuma bir neçə dəfə təkrarlanır.
  Future<UserModel> _fetchProfileWithRetry(String userId, {int attempts = 4}) async {
    for (var i = 0; i < attempts; i++) {
      try {
        return await _fetchProfile(userId);
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
      return _fetchProfileWithRetry(user.id);
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
      return _fetchProfile(user.id);
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
      return _fetchProfileWithRetry(user.id);
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
  Future<UserModel> updateProfile({required String fullName}) async {
    final userId = client.auth.currentUser?.id;
    if (userId == null) throw const UnauthorizedException();
    try {
      final row = await client
          .from('profiles')
          .update({'full_name': fullName})
          .eq('id', userId)
          .select()
          .single();
      return UserModel.fromJson(row);
    } on PostgrestException catch (e) {
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
      final row = await client
          .from('profiles')
          .update({'avatar_url': publicUrl})
          .eq('id', userId)
          .select()
          .single();
      return UserModel.fromJson(row);
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
      return _fetchProfile(user.id);
    });
  }
}
