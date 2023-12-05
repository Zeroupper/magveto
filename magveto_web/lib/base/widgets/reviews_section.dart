import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magveto_web/base/domain/review.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/widgets/next_page_button.dart';
import 'package:magveto_web/base/widgets/review_widget.dart';
import 'package:magveto_web/base/widgets/section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  final _controller = PageController();

  double _sectionPadding = 64.0;

  final List<Review> reviews = [
    Review.mock(),
    Review.mock(),
    Review.mock(),
    Review.mock(),
    Review.mock(),
    Review.mock(),
    Review.mock(),
    Review.mock(),
    Review.mock(),
    Review.mock(),
  ];

  late List<Widget> _pages;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    calculateWidgetsInOnePage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Section(
      title: 'Vélemények',
      heightFactor: context.isDesktop() ? 0.7 : 1,
      padding: const EdgeInsets.symmetric(
        vertical: 64.0,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.only(right: _sectionPadding),
            child: PageView(
              pageSnapping: false,
              controller: _controller,
              children: _pages,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: _pages.length,
                  onDotClicked: (index) => _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn,
                  ),
                  effect: JumpingDotEffect(
                    paintStyle: PaintingStyle.stroke,
                    dotColor: theme.colorScheme.onSurface,
                    activeDotColor: theme.colorScheme.primary,
                    spacing: 16,
                    dotHeight: 16,
                    dotWidth: 16,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Align(
              child: NextPageButton(
                controller: _controller,
                pageCount: _pages.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void calculateWidgetsInOnePage() {
    const widgetWidth = 400.0;
    final horizontalGap = context.theme().cardTheme.margin?.horizontal ?? 0;
    final availableWidth = min(context.getScreenSize().width, 1600) - _sectionPadding;
    final widgetsInOnePage = (availableWidth / (widgetWidth + horizontalGap)).floor();

    _pages = [];

    if (widgetsInOnePage == 0) {
      _sectionPadding = 16;
      _pages = reviews
          .map(
            (review) => Align(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ReviewWidget(
                    review: review,
                  ),
                ),
              ),
            ),
          )
          .toList();
      return;
    }

    for (int i = 0; i < reviews.length; i += widgetsInOnePage) {
      final pageEnd = (i + widgetsInOnePage < reviews.length) ? i + widgetsInOnePage : reviews.length;
      final pageItems = reviews.sublist(i, pageEnd);

      _pages.add(
        Row(
          mainAxisAlignment: widgetsInOnePage == 1 ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
          children: pageItems
              .map(
                (review) => Align(
                  child: Card(
                    child: Container(
                      width: widgetWidth,
                      padding: const EdgeInsets.all(32.0),
                      child: ReviewWidget(
                        review: review,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
    }
  }
}
