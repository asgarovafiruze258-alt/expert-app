import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// "Inter" Azərbaycan (Latin Extended) və Rus (Kiril) simvollarını dəstəkləyir.
class AppTextStyles {
  const AppTextStyles._();

  static TextTheme textTheme(Color color) {
    return GoogleFonts.interTextTheme().apply(
      bodyColor: color,
      displayColor: color,
    );
  }
}
