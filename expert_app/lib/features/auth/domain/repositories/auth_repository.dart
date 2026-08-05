import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> registerWithEmail({
    required String email,
    required String password,
    required String fullName,
  });

  Future<Either<Failure, UserEntity>> loginWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> sendPasswordResetEmail({required String email});

  Future<Either<Failure, Unit>> sendPhoneOtp({required String phone});

  Future<Either<Failure, UserEntity>> verifyPhoneOtp({
    required String phone,
    required String otp,
  });

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, UserEntity?>> getCurrentUser();

  /// Session dəyişikliklərini (login/logout) canlı izləmək üçün.
  Stream<UserEntity?> get authStateChanges;
}
