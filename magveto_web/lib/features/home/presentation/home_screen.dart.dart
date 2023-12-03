import 'package:flutter/material.dart';
import 'package:magveto_web/base/widgets/magveto_scaffold.dart';
import 'package:magveto_web/base/widgets/team_section.dart';
import 'package:magveto_web/features/home/presentation/media_section.dart';
import 'package:magveto_web/features/home/presentation/pray_camp_section.dart';
import 'package:magveto_web/features/home/presentation/contact_us_section.dart';
import 'package:magveto_web/base/widgets/footer.dart';
import 'package:magveto_web/features/home/presentation/hk_section.dart';
import 'package:magveto_web/features/home/presentation/home_section.dart';
import 'package:magveto_web/features/home/presentation/magveto_section.dart';
import 'package:magveto_web/features/home/presentation/praise_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MagvetoScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeSection(),
            const MagvetoSection(),
            const TeamSection(),
            const MediaSection(),
            const HkSection(),
            const PrayCampSection(),
            const PraiseSection(),
            ContactUsSection(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
