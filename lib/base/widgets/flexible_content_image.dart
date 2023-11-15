import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto/base/widgets/teaser_text_widget.dart';

enum ImagePosition { top, bottom, left, right }

class FlexibleContentWidget extends StatelessWidget {
  final String body;
  final String headline;
  final String? imagePath;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final ImagePosition imagePosition;
  final Widget? actionButton;

  const FlexibleContentWidget({
    super.key,
    required this.body,
    required this.headline,
    this.imagePath,
    required this.onTap,
    this.imagePosition = ImagePosition.left,
    this.actionButton,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final width = min(MediaQuery.of(context).size.width, 1600);
    final height = MediaQuery.of(context).size.height;

    final imageWidget = Align(
      alignment: Alignment.center,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 2), blurRadius: 4, spreadRadius: 0),
          ],
        ),
        width: imagePosition == ImagePosition.top || imagePosition == ImagePosition.bottom ? width.toDouble() : 0.4 * width,
        height: imagePosition == ImagePosition.left || imagePosition == ImagePosition.right ? null : 0.3 * height,
        child: imagePath == null
            ? const SizedBox(
                width: 640,
                height: 360,
                child: Placeholder(),
              )
            : AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  imagePath!,
                  fit: BoxFit.fitWidth,
                ),
              ),
      ),
    );

    final textWidget = SizedBox(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TeaserTextWidget(body: body, headline: headline, onTap: onTap),
          const Gap(24.0),
          if (actionButton != null) actionButton!,
        ],
      ),
    );

    return Padding(
      padding: padding ?? const EdgeInsets.all(64.0),
      child: imagePosition == ImagePosition.top || imagePosition == ImagePosition.bottom
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: imagePosition == ImagePosition.top ? [imageWidget, const Gap(32.0), textWidget] : [textWidget, const Gap(32.0), imageWidget],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: imagePosition == ImagePosition.left
                  ? [imageWidget, const Gap(32.0), Flexible(child: textWidget), const Gap(16.0)]
                  : [Flexible(child: textWidget), const Gap(32.0), imageWidget, const Gap(16.0)],
            ),
    );
  }
}
