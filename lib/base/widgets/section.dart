import 'dart:math';

import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? height;

  const Section({super.key, required this.child, this.padding, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * (height ?? 1),
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: max(MediaQuery.of(context).size.width, 1600),
      ),
      padding: padding ?? const EdgeInsets.all(64),
      child: child,
    );
  }
}
