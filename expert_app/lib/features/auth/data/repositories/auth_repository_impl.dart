import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl(this.remoteDataSource);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    if (error is UnauthorizedException) return Failure.unauthorized(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  @override
  Future<Either<Failure, UserEntity>> registerWithEmail({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final model = await remoteDataSource.registerWithEmail(
        email: email,
        password: password,
        fullName: fullName,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final model = await remoteDataSource.loginWithEmail(email: email, password: password);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendPasswordResetEmail({required String email}) async {
    try {
      await remoteDataSource.sendPasswordResetEmail(email: email);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendPhoneOtp({required String phone}) async {
    try {
      await remoteDataSource.sendPhoneOtp(phone: phone);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyPhoneOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final model = await remoteDataSource.verifyPhoneOtp(phone: phone, otp: otp);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final model = await remoteDataSource.getCurrentUser();
      return Right(model?.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String fullName,
    String? phone,
    DateTime? dateOfBirth,
  }) async {
    try {
      final model = await remoteDataSource.updateProfile(
        fullName: fullName,
        phone: phone,
        dateOfBirth: dateOfBirth,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateAvatar({
    required Uint8List bytes,
    required String fileExt,
  }) async {
    try {
      final model = await remoteDataSource.updateAvatar(bytes: bytes, fileExt: fileExt);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Stream<UserEntity?> get authStateChanges =>
      remoteDataSource.authStateChanges.map((model) => model?.toEntity());
}
