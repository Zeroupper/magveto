import 'package:flutter/material.dart';
import 'package:magveto_web/base/domain/event.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/widgets/event_time_table_item_widget.dart';

class EventTimetableWidget extends StatelessWidget {
  final List<Event> events;

  const EventTimetableWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.all(24.0),
      color: theme.cardColor.withOpacity(0.95),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ESEMÉNYEK',
              style: Theme.of(context).textTheme.headlineMedium?.withSemiBold(),
            ),
            const Divider(),
            ...events.map(
              (event) => EventTimetableItemeWidget(
                event: event,
                islast: events.last == event,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
