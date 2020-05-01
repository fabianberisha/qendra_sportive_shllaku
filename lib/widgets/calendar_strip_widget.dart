import 'package:flutter/material.dart';
import 'package:calendar_strip/calendar_strip.dart';
import 'package:provider/provider.dart';

import '../widgets/match_available_widget.dart';
import '../models/ndeshjet.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ndeshjetProv = Provider.of<NdeshjetItem>(context);

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
              startDate: DateTime.now(),
              endDate: ndeshjetProv.end,
              onDateSelected: (date) {
                ndeshjetProv.onTap(date);
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        MatchAvailable()
      ],
    );
  }
}
