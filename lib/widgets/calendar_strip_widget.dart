import 'package:flutter/material.dart';
import 'package:calendar_strip/calendar_strip.dart';
import '../widgets/match_available_widget.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  var tapedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final nextMonth = DateTime.now().month + 1;
    final substract = 31 - DateTime.now().day;
    final days = 31 - substract;
    final start = DateTime.now();
    final end = DateTime(DateTime.now().year, nextMonth, days);
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
            color: Colors.lightBlue,
          ),
          height: 100,
          margin: EdgeInsets.all(10),
          child: Card(
            elevation: 6,
            child: CalendarStrip(
              startDate: start,
              endDate: end,
              onDateSelected: (date) {
                setState(() {
                  tapedDate = date;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        MatchAvailable(tapedDate)
      ],
    );
  }
}
