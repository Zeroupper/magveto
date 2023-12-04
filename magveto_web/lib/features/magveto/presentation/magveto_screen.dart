import 'package:flutter/material.dart';
import 'package:magveto_web/base/helpers/section_helper.dart';
import 'package:magveto_web/base/widgets/magveto_scaffold.dart';
import 'package:magveto_web/base/widgets/team_section.dart';
import 'package:magveto_web/features/magveto/presentation/event_section.dart';
import 'package:magveto_web/features/magveto/presentation/features_section.dart';
import 'package:magveto_web/features/magveto/presentation/media_section.dart';
import 'package:magveto_web/features/magveto/presentation/contact_us_section.dart';
import 'package:magveto_web/base/widgets/footer.dart';
import 'package:magveto_web/features/magveto/presentation/goal_section.dart';
import 'package:magveto_web/features/magveto/presentation/home_section.dart';
import 'package:magveto_web/features/magveto/presentation/about_section.dart';

class MagvetoScreen extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;

  const MagvetoScreen({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return MagvetoScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeSection(),
            const FeaturesSection(),
            const EventSection(),
            AboutSection(
              key: sectionKeys[SectionHelper.magveto().about],
            ),
            TeamSection(
              key: sectionKeys[SectionHelper.magveto().team],
              title: SectionHelper.magveto().team,
            ),
            GoalSection(
              key: sectionKeys[SectionHelper.magveto().goal],
            ),
            MediaSection(
              key: sectionKeys[SectionHelper.magveto().media],
            ),
            TeamSection(
              key: sectionKeys[SectionHelper.magveto().prevTeam],
              title: SectionHelper.magveto().prevTeam,
            ),
            ContactUsSection(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
