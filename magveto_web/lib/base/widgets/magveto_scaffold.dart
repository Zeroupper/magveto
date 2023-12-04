import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magveto_web/base/helpers/section_helper.dart';
import 'package:magveto_web/base/routes/routes.dart';
import 'package:magveto_web/base/widgets/web_menu_bar.dart';

class MagvetoScaffold extends StatelessWidget {
  final Widget child;

  const MagvetoScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SelectionArea(child: child),
            WebMenuBar(
              menuItems: [
                WebMenuItem(
                  name: 'Magvető',
                  items: [
                    SectionHelper.magveto().about,
                    SectionHelper.magveto().goal,
                    SectionHelper.magveto().team,
                    SectionHelper.magveto().media,
                    SectionHelper.magveto().prevTeam,
                  ],
                  onTap: () {
                    context.goNamed(MagvetoRoute.name);
                  },
                  onSubMenuTap: (item) {
                    scrollToSection(MagvetoRoute.sectionKeys[item]);
                  },
                ),
                WebMenuItem(
                  name: 'Homokkomáromi Imatábor',
                  items: [
                    SectionHelper.hKCamp().about,
                    SectionHelper.hKCamp().team,
                  ],
                  onTap: () {
                    context.goNamed(HKCampRoute.name);
                  },
                  onSubMenuTap: (item) {
                    scrollToSection(HKCampRoute.sectionKeys[item]);
                  },
                ),
                WebMenuItem(
                  name: 'Felnőtt Imatábor',
                  items: [
                    SectionHelper.prayCamp().about,
                    SectionHelper.prayCamp().team,
                  ],
                  onTap: () {
                    context.goNamed(PrayCampRoute.name);
                  },
                  onSubMenuTap: (item) {
                    scrollToSection(PrayCampRoute.sectionKeys[item]);
                  },
                ),
                WebMenuItem(
                  name: 'Dicsőítés',
                  onTap: () {
                    context.goNamed(PraiseRoute.name);
                  },
                ),
                WebMenuItem(
                  name: 'Galléria',
                  onTap: () {
                    context.goNamed(GalleryRoute.name);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
    void scrollToSection(GlobalKey? key) {
    if (key == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (key.currentContext != null) {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}

