import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class VerifyPhoneOtpParams {
  final String phone;
  final String otp;

  const VerifyPhoneOtpParams({required this.phone, required this.otp});
}

class VerifyPhoneOtp implements UseCase<UserEntity, VerifyPhoneOtpParams> {
  final AuthRepository repository;

  const VerifyPhoneOtp(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(VerifyPhoneOtpParams params) {
    return repository.verifyPhoneOtp(phone: params.phone, otp: params.otp);
  }
}
