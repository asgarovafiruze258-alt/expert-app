import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_constants.dart';

/// TODO(Mərhələ 5+): seçilmiş dili SharedPreferences ilə qalıcı saxla.
class LocaleNotifier extends Notifier<Locale> {
  @override
  Locale build() => const Locale(AppConstants.defaultLocaleCode);

  void setLocale(Locale locale) {
    if (AppConstants.supportedLocaleCodes.contains(locale.languageCode)) {
      state = locale;
    }
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, Locale>(LocaleNotifier.new);
