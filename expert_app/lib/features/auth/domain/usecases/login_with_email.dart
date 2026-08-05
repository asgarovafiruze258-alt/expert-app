import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmailParams {
  final String email;
  final String password;

  const LoginWithEmailParams({required this.email, required this.password});
}

class LoginWithEmail implements UseCase<UserEntity, LoginWithEmailParams> {
  final AuthRepository repository;

  const LoginWithEmail(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginWithEmailParams params) {
    return repository.loginWithEmail(email: params.email, password: params.password);
  }
}
