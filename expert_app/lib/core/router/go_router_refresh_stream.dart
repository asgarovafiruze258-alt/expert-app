import 'dart:async';

import 'package:flutter/foundation.dart';

/// go_router-in `refreshListenable`-ı üçün istənilən Stream-i ChangeNotifier-ə çevirir.
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
