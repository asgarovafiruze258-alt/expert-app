import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/config/supabase_config.dart' as config;
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) => config.supabase);

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authRemoteDataSourceProvider));
});

/// Cari sessiyanı canlı izləyir — go_router redirect məntiqi bunu istifadə edir.
final authStateChangesProvider = StreamProvider<UserEntity?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

class EditProfileController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> updateFullName(String fullName) async {
    state = const AsyncLoading();
    final result = await ref.read(authRepositoryProvider).updateProfile(fullName: fullName);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(authStateChangesProvider);
        return true;
      },
    );
  }

  Future<bool> updateAvatar({required Uint8List bytes, required String fileExt}) async {
    state = const AsyncLoading();
    final result =
        await ref.read(authRepositoryProvider).updateAvatar(bytes: bytes, fileExt: fileExt);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(authStateChangesProvider);
        return true;
      },
    );
  }
}

final editProfileControllerProvider =
    AsyncNotifierProvider<EditProfileController, void>(EditProfileController.new);
