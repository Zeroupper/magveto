import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: const Color(0xFFFFCF69), fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const Gap(12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Magvető',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: inverseFontColor,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const Gap(8.0),
                Text(
                  'Homokkomáromi imatábor',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: inverseFontColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Gap(8.0),
                Text(
                  'Felnőtt imatábor',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: inverseFontColor,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const Gap(8.0),
                Text(
                  'Dicsőítés',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: inverseFontColor,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const Gap(8.0),
                Text(
                  'Gallérita',
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
