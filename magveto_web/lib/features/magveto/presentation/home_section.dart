import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/widgets/section.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Section(
      padding: const EdgeInsets.only(
        top: 128,
        left: 64.0,
        right: 0,
        bottom: 64.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Üdvözlünk a Magvető közösség honlapján!',
                        style: context.isDesktop() ? theme.textTheme.displayLarge.withBold() : theme.textTheme.displayMedium.withBold(),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(12.0),
                      Text(
                        '„Jöjjetek mind és ujjongjatok végtelen szeretetén! Hirdessétek napról napra a megváltás örömhírét!”',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: context.customTheme()?.subtitleColor,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(36.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle().big(theme),
                        child: const Text('Keress minket!'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(32.0),
          if (context.isDesktop())
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/small_group.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
