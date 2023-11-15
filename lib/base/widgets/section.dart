import 'dart:math';

import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? height;
  final String? title;

  const Section({
    super.key,
    required this.child,
    this.padding,
    this.height,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * (height ?? 1),
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: min(MediaQuery.of(context).size.width, 1600),
        ),
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
