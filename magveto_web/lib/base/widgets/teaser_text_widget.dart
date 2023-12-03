import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/widgets/hoverable_text.dart';

class TeaserTextWidget extends StatelessWidget {
  final String body;
  final String? headline;
  final TextStyle? bodyTextStyle;
  final TextStyle? headlineTextStyle;
  final VoidCallback? onReadMoreTap;

  const TeaserTextWidget({
    super.key,
    required this.body,
    this.headline,
    this.onReadMoreTap,
    this.bodyTextStyle,
    this.headlineTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headline != null) ...[
          Text(
            headline!,
            style: headlineTextStyle ?? theme.textTheme.headlineMedium,
          ),
          const Gap(24.0),
        ],
        SelectableText.rich(
          TextSpan(
            style: bodyTextStyle ?? theme.textTheme.bodyLarge,
            children: [
              TextSpan(
                text: '$body ',
              ),
              if (onReadMoreTap != null)
                WidgetSpan(
                  child: HoverableText(
                    text: 'Read more...',
                    style: TextStyle(color: theme.colorScheme.primary).withSemiBold(),
                    onTap: onReadMoreTap!,
                  ),
                ),
            ],
          ),
          textAlign: TextAlign.justify,
          showCursor: false,
        ),
      ],
    );
  }
}
