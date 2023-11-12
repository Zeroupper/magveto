import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magveto/configs/color_schemes.g.dart';

class MagvetoTextTheme {
  TextTheme get light {
    final fontColor = lightColorScheme.onSurface;

    return GoogleFonts.robotoTextTheme().copyWith(
      displayLarge: TextStyle(
        color: fontColor,
      ),
      displayMedium: TextStyle(
        color: fontColor,
      ),
      displaySmall: TextStyle(
        color: fontColor,
      ),
      headlineLarge: TextStyle(
        color: fontColor,
      ),
      headlineMedium: TextStyle(
        color: fontColor,
      ),
      headlineSmall: TextStyle(
        color: fontColor,
      ),
      bodyLarge: TextStyle(
        color: fontColor,
      ),
      bodyMedium: TextStyle(
        color: fontColor,
      ),
      bodySmall: TextStyle(
        color: fontColor,
      ),
    );
  }

  TextTheme get dark {
    final fontColor = darkColorScheme.onSurface;

    return GoogleFonts.robotoTextTheme().copyWith(
      displayLarge: TextStyle(
        color: fontColor,
      ),
      displayMedium: TextStyle(
        color: fontColor,
      ),
      displaySmall: TextStyle(
        color: fontColor,
      ),
      headlineLarge: TextStyle(
        color: fontColor,
      ),
      headlineMedium: TextStyle(
        color: fontColor,
      ),
      headlineSmall: TextStyle(
        color: fontColor,
      ),
      bodyLarge: TextStyle(
        color: fontColor,
      ),
      bodyMedium: TextStyle(
        color: fontColor,
      ),
      bodySmall: TextStyle(
        color: fontColor,
      ),
    );
  }
}
