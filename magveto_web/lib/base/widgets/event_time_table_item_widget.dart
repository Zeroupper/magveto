import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/domain/event.dart';
import 'package:magveto_web/base/extensions/custom_theme.dart';
import 'package:magveto_web/base/extensions/extensions.dart';

class EventTimetableItemeWidget extends StatelessWidget {
  final Event event;
  final bool islast;

  const EventTimetableItemeWidget({
    super.key,
    required this.event,
    this.islast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = context.theme().extension<CustomTheme>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                VerticalDivider(
                  color: theme.primaryColor,
                  thickness: 4,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Text(
                        event.startTime.toMMMMddShortFormat(),
                        style: theme.textTheme.titleLarge?.withBold(),
                      ),
                      const Gap(8.0),
                      Text(
                        event.startTime.toHHmm(),
                        style: theme.textTheme.titleLarge?.withBold(),
                      ),
                    ],
                  ),
                ),
                const Gap(12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Imatábori jelentkezés',
                          style: theme.textTheme.headlineSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '1230, Türje Kelemen Pál út 6',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge?.copyWith(color: customTheme?.subtitleColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!islast) const Divider(),
        ],
      ),
    );
  }
}
