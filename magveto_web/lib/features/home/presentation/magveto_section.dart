import 'package:flutter/material.dart';
import 'package:magveto_web/base/widgets/next_page_button.dart';
import 'package:magveto_web/base/widgets/section.dart';
import 'package:magveto_web/base/widgets/flexible_content_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MagvetoSection extends StatefulWidget {
  const MagvetoSection({super.key});

  @override
  State<MagvetoSection> createState() => _MagvetoSectionState();
}

class _MagvetoSectionState extends State<MagvetoSection> {
  final _controller = PageController();

  final _pages = [
    const FlexibleContentWidget(
      imagePosition: ImagePosition.left,
      imagePath: 'assets/images/big_group.jpg',
      body:
          'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
      headline: 'Történetünk',
      margin: EdgeInsets.only(right: 16.0),
    ),
    const FlexibleContentWidget(
      imagePosition: ImagePosition.right,
      imagePath: 'assets/images/big_group.jpg',
      body:
          'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
      headline: 'Célunk',
      margin: EdgeInsets.only(right: 16.0),
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Section(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      title: 'Magvető',
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 64.0),
            child: PageView(
              pageSnapping: false,
              controller: _controller,
              children: _pages,
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
          Align(
            alignment: Alignment.bottomCenter,
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
        ],
      ),
    );
  }
}
