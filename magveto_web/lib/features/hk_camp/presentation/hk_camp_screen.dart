import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:magveto_web/base/domain/review.dart';
import 'package:magveto_web/base/enums/cloud_shape_type.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/helpers/section_helper.dart';
import 'package:magveto_web/base/widgets/cloud_widget.dart';
import 'package:magveto_web/base/widgets/magveto_scaffold.dart';
import 'package:magveto_web/base/widgets/review_widget.dart';
import 'package:magveto_web/base/widgets/team_section.dart';
import 'package:magveto_web/features/hk_camp/presentation/about_section.dart';
import 'package:magveto_web/features/hk_camp/presentation/features_section.dart';
import 'package:magveto_web/features/hk_camp/presentation/hk_reviews_section.dart';
import 'package:magveto_web/base/widgets/home_section.dart';
import 'package:magveto_web/base/widgets/footer.dart';

class HKCampScreen extends StatefulWidget {
  final Map<String, GlobalKey> sectionKeys;
  const HKCampScreen({super.key, required this.sectionKeys});

  @override
  State<HKCampScreen> createState() => _HKCampScreenState();
}

class _HKCampScreenState extends State<HKCampScreen> {
  final _feedbackSectionKey = GlobalKey();
  final _controller = ScrollController();

  bool _isFeedbackSectionActive = false;
  double offset = 0;

  bool isFeedbackSectionVisible() {
    if (_feedbackSectionKey.currentContext?.findRenderObject() == null) {
      return false;
    }

    final RenderBox feedbackRenderBox = _feedbackSectionKey.currentContext!.findRenderObject() as RenderBox;
    final feedbackPosition = feedbackRenderBox.localToGlobal(const Offset(0, 0)).dy;
    return feedbackPosition - context.getScreenSize().height / 4 > 0 && feedbackPosition - context.getScreenSize().height / 4 < 120;
  }

  int indexOfWidgetShown = 0;
  late Widget currentReviewShown;

  late List<Review> reviews = [
    Review.mock(id: '2', text: loremIpsum(words: 4)),
    Review.mock(id: '3', text: loremIpsum(words: 24)),
    Review.mock(id: '4', text: loremIpsum(words: 24)),
    Review.mock(id: '5', text: loremIpsum(words: 24)),
    Review.mock(id: '6', text: loremIpsum(words: 60)),
  ];

  late List<Widget> reviewWidgets;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      reviewWidgets = reviews
          .map(
            (review) => CloudWidget(
              key: ValueKey(review.id),
              type: context.isDesktop() ? CloudShapeType.wide : CloudShapeType.narrow,
              child: ReviewWidget(
                review: review,
              ),
            ),
          )
          .toList();
      currentReviewShown = reviewWidgets[indexOfWidgetShown];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MagvetoScaffold(
      child: Listener(
        onPointerSignal: (event) {
          if (isFeedbackSectionVisible()) {
            setState(() {
              _isFeedbackSectionActive = true;
            });
          }

          handleActiveFeedbackSection(event);
        },
        child: SingleChildScrollView(
          physics: _isFeedbackSectionActive ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
          controller: _controller,
          child: Column(
            children: [
              const HomeSection(
                title: 'Homokkomáromi imatábor',
                imagePath: 'assets/images/small_group.jpg',
              ),
              const FeaturesSection(),
              AboutSection(
                key: widget.sectionKeys[SectionHelper.hKCamp().about],
              ),
              HKReviewsSection(
                key: _feedbackSectionKey,
                heightFactor: context.isMobile() ? 1.0 : 0.7,
                currentReview: currentReviewShown,
              ),
              TeamSection(
                key: widget.sectionKeys[SectionHelper.hKCamp().team],
                title: SectionHelper.hKCamp().team,
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  void handleActiveFeedbackSection(PointerSignalEvent event) {
    if (!_isFeedbackSectionActive) return;

    if (event is PointerScrollEvent) {
      final maxScrollExtent = max(
        0.0,
        (reviews.length - 1) * event.scrollDelta.dy.abs(),
      );

      if (event.scrollDelta.dy < 0 && currentReviewShown == reviewWidgets[0]) {
        setState(() {
          _isFeedbackSectionActive = false;
        });
      }

      if (offset + event.scrollDelta.dy > maxScrollExtent) {
        setState(() {
          _isFeedbackSectionActive = false;
        });
      }

      offset += event.scrollDelta.dy;
      offset = offset.clamp(
        0.0,
        maxScrollExtent,
      );

      indexOfWidgetShown = offset ~/ (event.scrollDelta.dy.abs());

      setState(() {
        currentReviewShown = reviewWidgets[indexOfWidgetShown];
      });
    }
  }
}
