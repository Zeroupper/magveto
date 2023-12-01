import 'package:flutter/material.dart';
import 'package:magveto/base/extensions/custom_theme.dart';
import 'package:magveto/base/theme/secondary_text_theme.dart';
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
          margin: const EdgeInsets.all(24.0),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        textTheme: MagvetoTextTheme().lightRoboto,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          hintStyle: MagvetoTextTheme().lightRoboto.bodyLarge,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
        extensions: [
          SecondaryTextTheme(
            handWritten: const TextStyle(
              fontSize: 24.0,
              fontFamily: 'Cabin Sketch',
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomTheme(subtitleColor: Colors.black54),
        ],
      );

  ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: MagvetoTextTheme().darkRoboto,
        extensions: [
          SecondaryTextTheme(
            handWritten: const TextStyle(
              fontSize: 24.0,
              fontFamily: 'Cabin Sketch',
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomTheme(subtitleColor: Colors.white70),
        ],
      );
}
