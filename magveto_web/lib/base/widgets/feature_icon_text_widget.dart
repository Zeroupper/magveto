import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/theme/secondary_text_theme.dart';

class FeatureIconTextWidget extends StatelessWidget {
  final String fileName;
  final String text;
  final TextStyle? style;

  const FeatureIconTextWidget({
    super.key,
    required this.fileName,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final finalStyle = style ?? context.theme().extension<SecondaryTextTheme>()?.handWritten;

    return Container(
      margin: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SvgPicture.asset(
              'assets/icons/$fileName',
              colorFilter: theme.colorScheme.onSecondaryContainer.toColorFilter(),
            ),
          ),
          const Gap(8.0),
          Text(
            text,
            style: finalStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
