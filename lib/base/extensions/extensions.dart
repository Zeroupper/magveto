import 'package:flutter/material.dart';

extension TextStyleX on TextStyle? {
  TextStyle? withBold() {
    return this?.copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle? withSemiBold() {
    return this?.copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle? withMedium() {
    return this?.copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle? withItalic() {
    return this?.copyWith(fontStyle: FontStyle.italic);
  }
}

extension ButtonStyleX on ButtonStyle {
  ButtonStyle big(ThemeData theme) {
    return ButtonStyle(
      textStyle: MaterialStateProperty.all(
        theme.textTheme.headlineMedium?.withMedium(),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 24.0,
        ),
      ),
    );
  }
}
