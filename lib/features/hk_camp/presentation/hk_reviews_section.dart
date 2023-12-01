import 'package:flutter/material.dart';
import 'package:magveto/base/widgets/section.dart';

class HKReviewsSection extends StatelessWidget {
  final Widget currentReview;
  final double heightFactor;

  const HKReviewsSection({
    super.key,
    required this.currentReview,
    this.heightFactor = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      background: Image.asset(
        'assets/images/church_on_the_hill.png',
        fit: BoxFit.fill,
      ),
      fit: SectionFit.expanded,
      title: 'Vélemények',
      heightFactor: heightFactor,
      padding: const EdgeInsets.symmetric(horizontal: 64.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: currentReview,
        ),
      ),
    );
  }
}
