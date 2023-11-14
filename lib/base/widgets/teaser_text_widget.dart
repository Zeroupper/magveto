import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto/base/extensions/extensions.dart';
import 'package:magveto/base/widgets/hoverable_text.dart';

class TeaserTextWidget extends StatelessWidget {
  final String body;
  final String headline;
  final VoidCallback onTap;

  const TeaserTextWidget({super.key, required this.body, required this.headline, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headline,
          style: theme.textTheme.headlineMedium,
        ),
        const Gap(24.0),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: theme.textTheme.bodyLarge,
            children: [
              TextSpan(
                text: '$body ',
              ),
              WidgetSpan(
                child: HoverableText(
                  text: 'Read more...',
                  style: TextStyle(color: theme.colorScheme.primary).withSemiBold(),
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
