import 'package:flutter/material.dart';
import 'package:magveto_web/base/helpers/section_helper.dart';
import 'package:magveto_web/base/widgets/footer.dart';
import 'package:magveto_web/base/widgets/home_section.dart';
import 'package:magveto_web/base/widgets/magveto_scaffold.dart';
import 'package:magveto_web/base/widgets/reviews_section.dart';
import 'package:magveto_web/base/widgets/team_section.dart';
import 'package:magveto_web/features/pray_camp/presentation/about_section.dart';

class PrayCampScreen extends StatelessWidget {
    final Map<String, GlobalKey> sectionKeys;

  const PrayCampScreen({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return MagvetoScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeSection(
              title: '2024. felnőtt imatábor',
              imagePath: 'assets/images/small_group.jpg',
            ),
            AboutSection(
              key: sectionKeys[SectionHelper.prayCamp().about],
            ),
            const ReviewsSection(),
            TeamSection(
              key: sectionKeys[SectionHelper.prayCamp().team],
              title: SectionHelper.prayCamp().team,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
