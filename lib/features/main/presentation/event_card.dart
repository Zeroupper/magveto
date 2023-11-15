import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto/base/extensions/extensions.dart';
import 'package:magveto/features/main/domain/event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final bool isPrimary;

  const EventCard({super.key, required this.event, this.isPrimary = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Stack(
        children: [
          Image.asset(
            event.imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Theme.of(context).cardColor.withOpacity(0.97),
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      event.name,
                      style: isPrimary
                          ? theme.textTheme.headlineLarge.withSemiBold()
                          : theme.textTheme.headlineSmall.withSemiBold(),
                    ),
                    const Gap(32.0),
                    Text(
                      event.location,
                      style: isPrimary
                          ? theme.textTheme.headlineMedium
                          : theme.textTheme.titleMedium,
                    ),
                    Text(
                      event.startTime.toString(),
                      style: isPrimary
                          ? theme.textTheme.headlineMedium
                          : theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
