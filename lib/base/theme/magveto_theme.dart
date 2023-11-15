import 'package:flutter/material.dart';
import 'package:magveto/base/theme/magveto_text_theme.dart';
import 'package:magveto/configs/color_schemes.g.dart';

class MagvetoTheme {
  ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: lightColorScheme.surface,
        cardColor: const Color(0xFFFAF2E9),
        cardTheme: CardTheme(
          clipBehavior: Clip.hardEdge,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        textTheme: MagvetoTextTheme().light,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          hintStyle: MagvetoTextTheme().light.bodyLarge,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      );

  ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: MagvetoTextTheme().dark,
      );
}
