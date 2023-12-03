import 'package:flutter/material.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final Color? subtitleColor;

  CustomTheme({
    required this.subtitleColor,
  });

  @override
  CustomTheme copyWith({Color? subtitleColor, Color? danger}) {
    return CustomTheme(
      subtitleColor: subtitleColor ?? this.subtitleColor,
    );
  }

  @override
  CustomTheme lerp(CustomTheme? other, double t) {
    if (other is! CustomTheme) {
      return this;
    }
    return CustomTheme(
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t),
    );
  }
}
