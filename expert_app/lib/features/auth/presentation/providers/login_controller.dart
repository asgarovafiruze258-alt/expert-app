import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/login_with_email.dart';
import 'auth_providers.dart';

class LoginController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> login({required String email, required String password}) async {
    state = const AsyncLoading();
    final usecase = LoginWithEmail(ref.read(authRepositoryProvider));
    final result = await usecase(LoginWithEmailParams(email: email, password: password));

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

final loginControllerProvider =
    AsyncNotifierProvider<LoginController, void>(LoginController.new);
