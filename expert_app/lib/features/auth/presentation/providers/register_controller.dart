import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/register_with_email.dart';
import 'auth_providers.dart';

class RegisterController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    state = const AsyncLoading();
    final usecase = RegisterWithEmail(ref.read(authRepositoryProvider));
    final result = await usecase(
      RegisterWithEmailParams(email: email, password: password, fullName: fullName),
    );

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

final registerControllerProvider =
    AsyncNotifierProvider<RegisterController, void>(RegisterController.new);
