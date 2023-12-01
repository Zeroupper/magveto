import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magveto/base/routes/routes.dart';
import 'package:magveto/base/widgets/web_menu_bar.dart';

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
                    'Történetünk',
                    'Tagjaink',
                    'CD-k',
                    'Dalok / Kották',
                    'Képek',
                  ],
                  onTap: () {
                   context.goNamed(HomeRoute.name);
                  },
                ),
                WebMenuItem(
                  name: 'Homokkomáromi Imatábor',
                  items: [
                    'Az imatábor lényege',
                    'Kezdetek',
                    'Képek',
                  ],
                  onTap: () {
                    context.goNamed(HKCampRoute.name);
                  },
                ),
                WebMenuItem(
                  name: 'Felnőtt Imatábor',
                  items: [
                    'Mit jelent?',
                    'Tagjaink',
                    'Képek',
                  ],
                  onTap: () {
                    context.goNamed(PrayCampRoute.name);
                  },
                ),
                WebMenuItem(
                  name: 'Dicsőítés',
                  items: [
                    'Elindult',
                    'Képek',
                  ],
                  onTap: () {
                    context.goNamed(PraiseRoute.name);
                  },
                ),
                WebMenuItem(
                  name: 'Galléria',
                  items: [
                    'Passiójáték',
                    '60 másodperc',
                    'Betlehem',
                    'Régi emlékek',
                  ],
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
}
