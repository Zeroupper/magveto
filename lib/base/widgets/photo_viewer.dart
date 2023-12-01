import 'package:flutter/material.dart';
import 'package:magveto/base/extensions/extensions.dart';
import 'package:magveto/base/widgets/image_card.dart';

class ImageViewer extends StatefulWidget {
  final List<String> images;

  const ImageViewer({super.key, required this.images});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late PageController _pageController;

  int selectedIndex = 0;

  late double _pageWidth;
  late double _pageHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pageWidth = 0.6;
    calculateDimensions();
    _pageController = PageController(viewportFraction: _pageWidth);
  }

  void calculateDimensions() {
    double screenWidth = context.getScreenSize().width;
    double screenHeight = context.getScreenSize().height;

    double initialPageWidth = screenWidth * _pageWidth;
    double initialPageHeight = initialPageWidth * 16 / 9;

    setState(() {
      if (initialPageHeight > screenHeight) {
        _pageHeight = screenHeight;
        _pageWidth = _pageHeight * 9 / 16 / screenWidth;
      } else {
        _pageHeight = initialPageHeight;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
            ),
          ),
        ),
        Align(
          child: SizedBox(
            width: context.getScreenSize().width,
            height: _pageHeight,
            child: PageView(
              controller: _pageController,
              pageSnapping: false,
              children: widget.images
                  .map(
                    (image) => ImageCard(
                      onTap: () {
                        _pageController.animateToPage(
                          widget.images.indexOf(image),
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                      imagePath: 'assets/images/small_group.jpg',
                      isSelected: widget.images.indexOf(image) == selectedIndex,
                    ),
                  )
                  .toList(),
              onPageChanged: (value) => setState(
                () {
                  selectedIndex = value;
                },
              ),
            ),
          ),
        ),
        Positioned(
          top: 24,
          right: 32,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.colorScheme.surface,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.close,
                    size: 32,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
