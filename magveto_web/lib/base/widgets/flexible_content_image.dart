import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/extensions/extensions.dart';

enum ImagePosition { top, bottom, left, right }

class FlexibleContentWidget extends StatefulWidget {
  final Widget child;
  final String? headline;
  final String? imagePath;
  final VoidCallback? onReadMoreTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final ImagePosition imagePosition;
  final Widget? actionButton;

  const FlexibleContentWidget({
    super.key,
    required this.child,
    this.headline,
    this.imagePath,
    this.onReadMoreTap,
    this.imagePosition = ImagePosition.left,
    this.actionButton,
    this.padding,
    this.margin,
  });

  @override
  State<FlexibleContentWidget> createState() => _FlexibleContentWidgetState();
}

class _FlexibleContentWidgetState extends State<FlexibleContentWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
        height: widget.imagePosition == ImagePosition.left || widget.imagePosition == ImagePosition.right ? null : 0.3 * height,
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

    final textWidget = Align(
      alignment: widget.imagePosition.toAlignment(),
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.child,
            
            const Gap(24.0),
            if (widget.actionButton != null) widget.actionButton!,
          ],
        ),
      ),
    );

    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      padding: widget.padding ?? const EdgeInsets.all(64.0),
      child: widget.imagePosition == ImagePosition.top || widget.imagePosition == ImagePosition.bottom
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.imagePosition == ImagePosition.top
                  ? [
                      if (context.isDesktop())
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: imageWidget),
                              const Gap(32.0),
                            ],
                          ),
                        ),
                      textWidget,
                    ]
                  : [
                      textWidget,
                      if (context.isDesktop())
                        Expanded(
                          child: Column(
                            children: [
                              const Gap(32.0),
                              Expanded(child: imageWidget),
                            ],
                          ),
                        ),
                    ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.imagePosition == ImagePosition.left
                  ? [
                      if (context.isDesktop())
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(child: imageWidget),
                              const Gap(32.0),
                            ],
                          ),
                        ),
                      Expanded(
                        child: textWidget,
                      ),
                    ]
                  : [
                      Expanded(
                        child: textWidget,
                      ),
                      if (context.isDesktop())
                        Expanded(
                          child: Row(
                            children: [
                              const Gap(32.0),
                              Expanded(
                                child: imageWidget,
                              ),
                            ],
                          ),
                        ),
                    ],
            ),
    );
  }
}
