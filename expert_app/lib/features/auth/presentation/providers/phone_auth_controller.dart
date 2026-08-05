import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/send_phone_otp.dart';
import '../../domain/usecases/verify_phone_otp.dart';
import 'auth_providers.dart';

class PhoneAuthController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> sendOtp(String phone) async {
    state = const AsyncLoading();
    final usecase = SendPhoneOtp(ref.read(authRepositoryProvider));
    final result = await usecase(SendPhoneOtpParams(phone: phone));

    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        return true;
      },
    );
  }

  Future<bool> verifyOtp({required String phone, required String otp}) async {
    state = const AsyncLoading();
    final usecase = VerifyPhoneOtp(ref.read(authRepositoryProvider));
    final result = await usecase(VerifyPhoneOtpParams(phone: phone, otp: otp));

    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        return true;
      },
    );
  }
}

final phoneAuthControllerProvider =
    AsyncNotifierProvider<PhoneAuthController, void>(PhoneAuthController.new);
