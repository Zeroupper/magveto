import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  final PageController controller;
  final int pageCount;

  const NextPageButton({
    super.key,
    required this.controller,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          int nextPage = (controller.page! + 1).floor();
          if (nextPage >= pageCount) {
            nextPage = 0;
          }
          controller.animateToPage(
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
    );
  }
}
