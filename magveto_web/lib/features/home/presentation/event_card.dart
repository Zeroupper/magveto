import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/domain/event.dart';
import 'package:magveto_web/base/extensions/extensions.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({super.key, required this.event});

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
                      style: theme.textTheme.headlineLarge.withSemiBold(),
                    ),
                    const Gap(32.0),
                    Text(
                      event.location,
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text(
                      event.startTime.toString(),
                      style: theme.textTheme.headlineMedium,
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
