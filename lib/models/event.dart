import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Event {
  Event({
    required this.eventName,
    required this.from,
    required this.to,
    required this.color,
    required this.isAllDay,
    this.description = '',
  });

  String eventName;
  String description;
  DateTime from;
  DateTime to;
  Color color;
  bool isAllDay;

  void addToProvider(BuildContext context) {
    var eventDay = DateTime(this.from.year, this.from.month, this.from.day);
    if (context.read(eventsProvider).state[eventDay] != null) {
      context
          .read(eventsProvider)
          .state[eventDay]!
          .add(toNeatCleanCalendarEvent());
    } else {
      context
          .read(eventsProvider)
          .state
          .putIfAbsent(eventDay, () => [toNeatCleanCalendarEvent()]);
    }
  }

  NeatCleanCalendarEvent toNeatCleanCalendarEvent() {
    return NeatCleanCalendarEvent(
      'My Event',
      startTime: this.from,
      endTime: this.to,
      color: this.color,
      isAllDay: this.isAllDay,
      description: this.description,
    );
  }
}

// Map<DateTime, List<NeatCleanCalendarEvent>> events = {
//   DateTime.parse('2021-05-20'): [
//     NeatCleanCalendarEvent(
//       'My Event',
//       startTime: DateTime.parse("2021-05-20 17:30:00"),
//       endTime: DateTime.parse("2021-05-20 17:30:00"),
//       color: Colors.orange,
//     )
//   ],
// };

final eventsProvider = StateProvider((_) => {
      DateTime.parse('2021-05-20'): [
        NeatCleanCalendarEvent(
          'My Event',
          startTime: DateTime.parse("2021-05-20 17:30:00"),
          endTime: DateTime.parse("2021-05-20 17:30:00"),
          color: Colors.orange,
        )
      ],
    });
