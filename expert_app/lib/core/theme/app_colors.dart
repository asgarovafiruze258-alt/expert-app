import 'package:flutter/material.dart';

/// Tikinti/təmir mövzusuna uyğun rəng paleti: isti "kərpic-narıncı" əsas rəng,
/// tünd boz/qrafit ikinci dərəcəli rəng.
class AppColors {
  const AppColors._();

  static const primary = Color(0xFFE06A2C);
  static const primaryDark = Color(0xFFF07C3C);

  static const secondary = Color(0xFF2B3A4A);
  static const secondaryDark = Color(0xFF3C4E62);

  static const success = Color(0xFF2E9E5B);
  static const warning = Color(0xFFE0A82C);
  static const error = Color(0xFFD64545);

  static const lightBlue = Color(0xFF3FA9F5);
  static const onLightBlue = Colors.white;
  static const lightBlueDark = Color(0xFF1E88E5);

  static const navIndicator = Color(0xFFBBDEFB);
  static const onNavIndicator = Color(0xFF0D47A1);
  static const navIndicatorDark = Color(0xFF1E3A5F);
  static const onNavIndicatorDark = Color(0xFFBBDEFB);

  /// Ana səhifənin üst paneli üçün açıq, isti-narıncı tonlu fon (işıqlı rejim).
  static const homeAppBarLight = Color(0xFFFBEADD);

  static const lightBackground = Color(0xFFFAFAFA);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightOnSurface = Color(0xFF1A1A1A);
  static const lightBorder = Color(0xFFE2E2E2);

  static const darkBackground = Color(0xFF121417);
  static const darkSurface = Color(0xFF1C1F23);
  static const darkOnSurface = Color(0xFFEDEDED);
  static const darkBorder = Color(0xFF2E3237);
}
