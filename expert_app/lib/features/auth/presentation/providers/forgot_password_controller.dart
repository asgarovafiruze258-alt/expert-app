import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/send_password_reset_email.dart';
import 'auth_providers.dart';

class ForgotPasswordController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> sendResetEmail(String email) async {
    state = const AsyncLoading();
    final usecase = SendPasswordResetEmail(ref.read(authRepositoryProvider));
    final result = await usecase(SendPasswordResetEmailParams(email: email));

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

final forgotPasswordControllerProvider =
    AsyncNotifierProvider<ForgotPasswordController, void>(ForgotPasswordController.new);
