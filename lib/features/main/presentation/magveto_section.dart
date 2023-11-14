import 'package:flutter/material.dart';
import 'package:magveto/base/widgets/section.dart';
import 'package:magveto/base/widgets/flexible_content_image.dart';

class MagvetoSection extends StatefulWidget {
  const MagvetoSection({super.key});

  @override
  State<MagvetoSection> createState() => _MagvetoSectionState();
}

class _MagvetoSectionState extends State<MagvetoSection> {
  int _activePage = 0;
  final _controller = PageController();

  final _pages = [
    FlexibleContentWidget(
      imagePosition: ImagePosition.left,
      imagePath: 'assets/images/big_group.jpg',
      body:
          'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
      headline: 'Történetünk',
      onTap: () {},
    ),
    FlexibleContentWidget(
      imagePosition: ImagePosition.right,
      imagePath: 'assets/images/big_group.jpg',
      body:
          'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
      headline: 'Célunk',
      onTap: () {},
    ),
    FlexibleContentWidget(
      imagePosition: ImagePosition.left,
      imagePath: 'assets/images/big_group.jpg',
      body:
          'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
      headline: 'Célunk',
      onTap: () {},
    ),
    FlexibleContentWidget(
      imagePosition: ImagePosition.right,
      imagePath: 'assets/images/big_group.jpg',
      body:
          'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
      headline: 'Célunk',
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Section(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      title: 'Magvető',
      child: Stack(
        children: [
          PageView(
            pageSnapping: false,
            controller: _controller,
            children: _pages,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  int nextPage = _activePage + 1;
                  if (nextPage >= _pages.length) {
                    nextPage = 0;
                  }
                  _controller.animateToPage(
                    nextPage,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn,
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 56,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _pages.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 32.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      _controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: 24,
                      width: 24,
                      curve: Curves.easeIn,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _activePage == index ? Theme.of(context).primaryColor : Colors.transparent,
                        border: Border.all(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
