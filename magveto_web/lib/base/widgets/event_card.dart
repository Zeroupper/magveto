import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/domain/event.dart';
import 'package:magveto_web/base/extensions/extensions.dart';

class EventCard extends StatelessWidget {
  final double width;
  final Event event;

  const EventCard({super.key, required this.event, required this.width});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: SizedBox(
        width: width,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: theme.colorScheme.surfaceVariant,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        event.startTime.toMMMMddShortFormat().toUpperCase(),
                        style: theme.textTheme.headlineSmall?.withBold()?.withColor(theme.colorScheme.onSurfaceVariant),
                      ),
                      const Gap(8.0),
                      Text(
                        event.startTime.toHHmm(),
                        style: theme.textTheme.titleLarge?.withBold()?.withColor(theme.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.name,
                        style: theme.textTheme.titleMedium?.withBold()?.withColor(theme.colorScheme.onSurface),
                      ),
                      const Gap(24.0),
                      Text(
                        event.description,
                        style: theme.textTheme.bodyMedium?.withMedium(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
