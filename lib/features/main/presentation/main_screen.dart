import 'package:flutter/material.dart';
import 'package:magveto/base/widgets/magveto_scaffold.dart';
import 'package:magveto/features/main/presentation/adult_camp_section.dart';
import 'package:magveto/features/main/presentation/contact_us_section.dart';
import 'package:magveto/features/main/presentation/footer.dart';
import 'package:magveto/features/main/presentation/hk_section.dart';
import 'package:magveto/features/main/presentation/home_section.dart';
import 'package:magveto/features/main/presentation/magveto_section.dart';
import 'package:magveto/features/main/presentation/praise_section.dart';

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
            const HkSection(),
            const AdultCampSection(),
            const PraiseSection(),
            ContactUsSection(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
