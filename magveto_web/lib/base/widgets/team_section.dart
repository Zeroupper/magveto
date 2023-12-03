import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magveto_web/base/domain/team_member.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/widgets/next_page_button.dart';
import 'package:magveto_web/base/widgets/section.dart';
import 'package:magveto_web/base/widgets/team_member_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TeamSection extends StatefulWidget {
  const TeamSection({super.key});

  @override
  State<TeamSection> createState() => _TeamSectionState();
}

class _TeamSectionState extends State<TeamSection> {
  final _sectionPadding = 64.0;

  final _controller = PageController();

  final List<TeamMember> team = [
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
    TeamMember.mock(),
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
      title: 'Tagjaink',
      heightFactor: context.isMobile() ? 1 : 0.7,
      padding: const EdgeInsets.symmetric(
        vertical: 64.0,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: _sectionPadding),
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
        ],
      ),
    );
  }

  void calculateWidgetsInOnePage() {
    const widgetWidth = 200.0;
    final horizontalGap = Theme.of(context).cardTheme.margin?.horizontal ?? 0;
    final availableWidth = min(context.getScreenSize().width, 1600) - 2 * _sectionPadding;
    final widgetsInOnePage = (availableWidth / (widgetWidth + horizontalGap)).floor();

    _pages = [];

    for (int i = 0; i < team.length; i += widgetsInOnePage) {
      final pageEnd = (i + widgetsInOnePage < team.length) ? i + widgetsInOnePage : team.length;
      final pageItems = team.sublist(i, pageEnd);

      _pages.add(
        Row(
          mainAxisAlignment: widgetsInOnePage == 1 ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
          children: pageItems
              .map(
                (member) => TeamMemberCard(teamMember: member, width: widgetWidth),
              )
              .toList(),
        ),
      );
    }
  }
}
