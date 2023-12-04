import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magveto_web/base/extensions/extensions.dart';

class Section extends StatelessWidget {
  final Widget child;
  final Widget? background;
  final EdgeInsets? padding;
  final double heightFactor;
  final String? title;
  final SectionFit fit;

  const Section({
    super.key,
    required this.child,
    this.background,
    this.padding,
    this.title,
    this.fit = SectionFit.expanded,
    this.heightFactor = 1,
  });

  @override
  Widget build(BuildContext context) {
    final content = Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * heightFactor,
          maxHeight: fit == SectionFit.expanded ? MediaQuery.of(context).size.height * heightFactor : double.infinity,
          maxWidth: min(MediaQuery.of(context).size.width, 1600),
        ),
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  title!,
                  style: context.theme().textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            fit == SectionFit.expanded ? Expanded(child: child) : child,
          ],
        ),
      ),
    );
    if (background != null) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(child: background!),
          content,
        ],
      );
    }
    return content;
  }
}

enum SectionFit { loose, expanded }
