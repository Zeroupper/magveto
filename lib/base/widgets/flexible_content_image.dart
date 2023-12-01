import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto/base/extensions/extensions.dart';
import 'package:magveto/base/widgets/teaser_text_widget.dart';

enum ImagePosition { top, bottom, left, right }

class FlexibleContentWidget extends StatefulWidget {
  final String body;
  final TextStyle? bodyTextStyle;
  final TextStyle? headlineTextStyle;
  final String? headline;
  final String? imagePath;
  final VoidCallback? onReadMoreTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final ImagePosition imagePosition;
  final Widget? actionButton;

  const FlexibleContentWidget({
    super.key,
    required this.body,
    this.headline,
    this.imagePath,
    this.onReadMoreTap,
    this.imagePosition = ImagePosition.left,
    this.actionButton,
    this.padding,
    this.margin, this.bodyTextStyle, this.headlineTextStyle,
  });

  @override
  State<FlexibleContentWidget> createState() => _FlexibleContentWidgetState();
}

class _FlexibleContentWidgetState extends State<FlexibleContentWidget> {
  late ImagePosition? adaptiveImagePosition;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.isDesktop()) {
      adaptiveImagePosition = widget.imagePosition;
    } else {
      adaptiveImagePosition = ImagePosition.bottom;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final imageWidget = Align(
      alignment: Alignment.center,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 2), blurRadius: 4, spreadRadius: 0),
          ],
        ),
        height: adaptiveImagePosition == ImagePosition.left ||
                adaptiveImagePosition == ImagePosition.right
            ? null
            : 0.3 * height,
        child: widget.imagePath == null
            ? const SizedBox(
                width: 640,
                height: 360,
                child: Placeholder(),
              )
            : AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  widget.imagePath!,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );

    final textWidget = SizedBox(
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TeaserTextWidget(
            body: widget.body,
            bodyTextStyle: widget.bodyTextStyle,
            headlineTextStyle: widget.headlineTextStyle,
            headline: widget.headline,
            onReadMoreTap: widget.onReadMoreTap,
          ),
          const Gap(24.0),
          if (widget.actionButton != null) widget.actionButton!,
        ],
      ),
    );

    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      padding: widget.padding ?? const EdgeInsets.all(64.0),
      child: adaptiveImagePosition == ImagePosition.top ||
              adaptiveImagePosition == ImagePosition.bottom
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: adaptiveImagePosition == ImagePosition.top
                  ? [imageWidget, const Gap(32.0), textWidget]
                  : [textWidget, const Gap(32.0), imageWidget],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: adaptiveImagePosition == ImagePosition.left
                  ? [
                      Expanded(
                        flex: 4,
                        child: imageWidget,
                      ),
                      const Gap(32.0),
                      Expanded(
                        flex: 6,
                        child: textWidget,
                      ),
                    ]
                  : [
                      Expanded(
                        flex: 6,
                        child: textWidget,
                      ),
                      const Gap(32.0),
                      Expanded(
                        flex: 4,
                        child: imageWidget,
                      ),
                    ],
            ),
    );
  }
}
