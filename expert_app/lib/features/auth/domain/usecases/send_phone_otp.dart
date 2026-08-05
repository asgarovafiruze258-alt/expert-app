import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class SendPhoneOtpParams {
  final String phone;

  const SendPhoneOtpParams({required this.phone});
}

class SendPhoneOtp implements UseCase<Unit, SendPhoneOtpParams> {
  final AuthRepository repository;

  const SendPhoneOtp(this.repository);

  @override
  Future<Either<Failure, Unit>> call(SendPhoneOtpParams params) {
    return repository.sendPhoneOtp(phone: params.phone);
  }
}
