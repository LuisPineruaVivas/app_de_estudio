import 'package:app_de_estudio/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin class SubThemeData {
  TextTheme getTextThemes() {
    return GoogleFonts.quicksandTextTheme(const TextTheme(
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(fontWeight: FontWeight.w400)));
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: onSurfaceTextColor, size: 16);
  }
}
