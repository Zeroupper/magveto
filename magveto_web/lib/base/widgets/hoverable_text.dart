import 'package:flutter/material.dart';
import 'package:magveto_web/base/widgets/web_clickable_widget.dart';

class HoverableText extends StatelessWidget {
  final VoidCallback onTap;
  final TextStyle? style;
  final String text;

  const HoverableText({
    super.key,
    required this.onTap,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return WebClickableWidget(
      onTap: onTap,
      builder: (_, isHovered) => SelectionContainer.disabled(
        child: Text(
          text,
          style: isHovered
              ? style?.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: style?.color,
                )
              : style,
        ),
      ),
    );
  }
}
