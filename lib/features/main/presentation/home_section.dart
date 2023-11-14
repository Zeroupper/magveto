import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto/base/extensions/extensions.dart';
import 'package:magveto/base/widgets/section.dart';
import 'package:magveto/features/main/domain/event.dart';
import 'package:magveto/features/main/presentation/event_card.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Section(
      padding: const EdgeInsets.only(
        top: 128,
        left: 64.0,
        right: 64.0,
        bottom: 64.0,
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Üdvözlünk a Magvető\nközösségünkben!',
                        style: theme.textTheme.displayLarge.withBold(),
                      ),
                      const Gap(24.0),
                      Theme(
                        data: theme.copyWith(),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle().big(theme),
                          child: const Text('Csatlakozz hozzánk!'),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(32.0),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: Row(
                    children: [
                      Flexible(child: EventCard(event: Event.mock())),
                      const Gap(32.0),
                      Flexible(child: EventCard(event: Event.mock())),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(32.0),
          Flexible(
            child: EventCard(
              event: Event.mock(),
              isPrimary: true,
            ),
          ),
        ],
      ),
    );
  }
}
