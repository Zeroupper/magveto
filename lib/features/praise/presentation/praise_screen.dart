import 'package:flutter/material.dart';
import 'package:magveto/base/widgets/footer.dart';
import 'package:magveto/base/widgets/home_section.dart';
import 'package:magveto/base/widgets/magveto_scaffold.dart';
import 'package:magveto/base/widgets/reviews_section.dart';
import 'package:magveto/features/praise/presentation/about_section.dart';

class PraiseScreen extends StatelessWidget {
  const PraiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MagvetoScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeSection(title: 'Dicsőítés', imagePath: 'assets/images/praise.png',),
            AboutSection(),
            ReviewsSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
