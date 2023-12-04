import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/domain/team_member.dart';
import 'package:magveto_web/base/extensions/extensions.dart';

class TeamMemberCard extends StatelessWidget {
  final double width;
  final TeamMember teamMember;

  const TeamMemberCard({super.key, required this.teamMember, required this.width});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = context.customTheme();

    return Card(
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 48.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(teamMember.imagePath),
            const Gap(24.0),
            Text(
              teamMember.name,
              style: theme.textTheme.titleMedium?.withSemiBold(),
              textAlign: TextAlign.center,
            ),
            Text(
              teamMember.description,
              style: theme.textTheme.bodyMedium?.withColor(customTheme?.subtitleColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
