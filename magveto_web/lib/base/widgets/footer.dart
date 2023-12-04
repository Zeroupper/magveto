import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/routes/routes.dart';
import 'package:magveto_web/base/widgets/hoverable_text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inverseFontColor = theme.colorScheme.onInverseSurface;

    return Container(
      width: double.infinity,
      color: theme.colorScheme.inverseSurface,
      padding: const EdgeInsets.all(64.0),
      child: SizedBox(
        width: 1600,
        child: Row(
          mainAxisAlignment: context.isDesktop() ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo/magveto_logo.png',
              width: 140,
              height: 140,
            ),
            const Gap(24.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Magvető közösség',
                    style: theme.textTheme.displaySmall?.copyWith(color: inverseFontColor),
                  ),
                  const Gap(8.0),
                  Text(
                    '„Jöjjetek mind és ujjongjatok végtelen szeretetén! Hirdessétek napról napra a megváltás örömhírét!”',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFFFFCF69),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            if (context.isDesktop())
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(12.0),
                  HoverableText(
                    onTap: () => context.goNamed(MagvetoRoute.name),
                    text: 'Magvető',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: inverseFontColor,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Gap(8.0),
                  HoverableText(
                    onTap: () => context.goNamed(HKCampRoute.name),
                    text: 'Homokkomáromi imatábor',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: inverseFontColor,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Gap(8.0),
                  HoverableText(
                    onTap: () => context.goNamed(PrayCampRoute.name),
                    text: 'Felnőtt imatábor',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: inverseFontColor,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Gap(8.0),
                  HoverableText(
                    onTap: () => context.goNamed(PraiseRoute.name),
                    text: 'Dicsőítés',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: inverseFontColor,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Gap(8.0),
                  HoverableText(
                    onTap: () => context.goNamed(GalleryRoute.name),
                    text: 'Galléria',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: inverseFontColor,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Gap(8.0),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
