import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto/base/domain/event.dart';
import 'package:magveto/base/extensions/extensions.dart';
import 'package:magveto/base/widgets/event_time_table_widget.dart';
import 'package:magveto/base/widgets/section.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final String imagePath;

  const HomeSection({
    super.key,
    required this.title,
    this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (onTap == null) {
      return Section(
        background: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(120),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w900,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            EventTimetableWidget(
              events: [
                Event.mock().copyWith(id: '1'),
                Event.mock().copyWith(id: '2'),
                Event.mock().copyWith(id: '3'),
                Event.mock().copyWith(id: '4'),
              ],
            ),
          ],
        ),
      );
    }

    return Section(
      padding: const EdgeInsets.only(
        bottom: 64.0,
        top: 120,
        left: 64.0,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.displayLarge
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
                const Gap(24.0),
                ElevatedButton(
                  onPressed: onTap,
                  style: const ButtonStyle().big(theme),
                  child: const Text('Jelentkezz a táborba!'),
                ),
              ],
            ),
          ),
          const Gap(32.0),
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: EventTimetableWidget(
                    events: [
                      Event.mock().copyWith(id: '1'),
                      Event.mock().copyWith(id: '2'),
                      Event.mock().copyWith(id: '3'),
                      Event.mock().copyWith(id: '4'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
