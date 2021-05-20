import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schoolender_flutter/models/event.dart';

class CalendarPage extends ConsumerWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var events = watch(eventsProvider).state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.plus),
            onPressed: () async {
              // Event event = Event(
              //     eventName: 'Test',
              //     from: DateTime.parse("2021-05-20 14:30:00"),
              //     to: DateTime.parse("2021-05-20 17:30:00"),
              //     color: Colors.blueAccent,
              //     isAllDay: false,
              //     description: 'this a test event');

              // event.addToProvider(context);
              // print(events);

              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    child: Container(
                      // height: 200,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Text('Heiii'),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: Container(
            child: Calendar(
          events: events,
          isExpandable: true,
          eventDoneColor: Colors.green,
          selectedColor: Colors.pink,
          todayColor: Colors.blue,
          locale: 'en_US',
          todayButtonText: 'Today',
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          dayOfWeekStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
        )),
      ),
    );
  }
}
