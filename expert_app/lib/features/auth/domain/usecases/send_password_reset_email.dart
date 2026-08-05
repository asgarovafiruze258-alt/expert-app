import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class SendPasswordResetEmailParams {
  final String email;

  const SendPasswordResetEmailParams({required this.email});
}

class SendPasswordResetEmail implements UseCase<Unit, SendPasswordResetEmailParams> {
  final AuthRepository repository;

  const SendPasswordResetEmail(this.repository);

  @override
  Future<Either<Failure, Unit>> call(SendPasswordResetEmailParams params) {
    return repository.sendPasswordResetEmail(email: params.email);
  }
}
