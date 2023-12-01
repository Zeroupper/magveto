import 'package:flutter/material.dart';

class SecondaryTextTheme extends ThemeExtension<SecondaryTextTheme> {
  final TextStyle? handWritten;

  SecondaryTextTheme({
    required this.handWritten,
  });

  @override
  SecondaryTextTheme copyWith({TextStyle? handWritten, Color? danger}) {
    return SecondaryTextTheme(
      handWritten: handWritten ?? this.handWritten,
    );
  }

  @override
  SecondaryTextTheme lerp(SecondaryTextTheme? other, double t) {
    if (other is! SecondaryTextTheme) {
      return this;
    }
    return SecondaryTextTheme(
      handWritten: TextStyle.lerp(handWritten, other.handWritten, t),
    );
  }
}
