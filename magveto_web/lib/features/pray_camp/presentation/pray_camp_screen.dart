import 'package:flutter/material.dart';
import 'package:magveto_web/base/widgets/footer.dart';
import 'package:magveto_web/base/widgets/home_section.dart';
import 'package:magveto_web/base/widgets/magveto_scaffold.dart';
import 'package:magveto_web/base/widgets/reviews_section.dart';
import 'package:magveto_web/base/widgets/team_section.dart';
import 'package:magveto_web/features/pray_camp/presentation/about_section.dart';

class PrayCampScreen extends StatelessWidget {
  const PrayCampScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MagvetoScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeSection(
              title: '2024. felnőtt imatábor',
              imagePath: 'assets/images/small_group.jpg',
            ),
            AboutSection(),
            ReviewsSection(),
            TeamSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
