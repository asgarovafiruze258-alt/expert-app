import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterWithEmailParams {
  final String email;
  final String password;
  final String fullName;

  const RegisterWithEmailParams({
    required this.email,
    required this.password,
    required this.fullName,
  });
}

class RegisterWithEmail implements UseCase<UserEntity, RegisterWithEmailParams> {
  final AuthRepository repository;

  const RegisterWithEmail(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(RegisterWithEmailParams params) {
    return repository.registerWithEmail(
      email: params.email,
      password: params.password,
      fullName: params.fullName,
    );
  }
}
