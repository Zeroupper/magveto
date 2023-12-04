import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magveto_web/base/enums/cloud_shape_type.dart';
import 'package:magveto_web/base/extensions/custom_theme.dart';
import 'package:magveto_web/base/widgets/flexible_content_image.dart';

extension TextStyleX on TextStyle? {
  TextStyle? withBold() => this?.copyWith(fontWeight: FontWeight.w700);

  TextStyle? withSemiBold() => this?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? withMedium() => this?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? withItalic() => this?.copyWith(fontStyle: FontStyle.italic);

  TextStyle? withColor(Color? newColor) => this?.copyWith(color: newColor);
}

extension ButtonStyleX on ButtonStyle {
  ButtonStyle big(ThemeData theme) => ButtonStyle(
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

extension BuildContextX on BuildContext {
  bool isMobile() => getScreenSize().width <= 480;

  bool isTablet() => getScreenSize().width <= 768;

  bool isDesktop() => getScreenSize().width > 768;

  Size getScreenSize() => MediaQuery.of(this).size;

  ThemeData theme() => Theme.of(this);

  CustomTheme? customTheme() => theme().extension<CustomTheme>();
}

extension ColorX on Color {
  ColorFilter toColorFilter() => ColorFilter.mode(this, BlendMode.srcIn);
}

extension DateTimeX on DateTime {
  String toyyyyMMMMFormat() => DateFormat('yyyy MMMM').format(this);

  String toMMMMddFormat() {
    return DateFormat('MMMM dd').format(this);
  }

  String toMMMMddShortFormat() {
    return '${toMMMMShortFormat()} $day.';
  }

  String toMMMMShortFormat() => DateFormat('MMMM').format(this).substring(0, 3);

  String toHHmm() => DateFormat('HH:mm').format(this);
}

extension CloudShapeTypeX on CloudShapeType {
  EdgeInsets toPadding(double maxWidth) => switch (this) {
        CloudShapeType.wide => EdgeInsets.only(
            right: maxWidth * 0.25,
            left: maxWidth * 0.25,
            bottom: maxWidth * 0.05,
            top: maxWidth * 0.2,
          ),
        CloudShapeType.narrow => EdgeInsets.all(maxWidth * 0.2),
      };

  Size originalSize() => switch (this) {
        CloudShapeType.wide => const Size(356, 158),
        CloudShapeType.narrow => const Size(311, 197),
      };
}

extension ImagePositionX on ImagePosition {
  Alignment toAlignment() => switch (this) {
        ImagePosition.top => Alignment.topCenter,
        ImagePosition.right => Alignment.centerRight,
        ImagePosition.left => Alignment.centerLeft,
        ImagePosition.bottom => Alignment.bottomCenter,
      };
}
