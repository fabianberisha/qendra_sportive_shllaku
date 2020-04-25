//import 'package:calendarro/calendarro.dart';
import 'package:flutter/material.dart';
import 'package:calendar_strip/calendar_strip.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../models/ndeshjet.dart';

class RezervoScreen extends StatefulWidget {
  static const routeName = '/rezervo_screen';

  @override
  _RezervoScreenState createState() => _RezervoScreenState();
}

class _RezervoScreenState extends State<RezervoScreen> {
  var dateTime = DateFormat.MMMMd().format(DateTime.now());
  var tapedDate = DateTime.now();

  Widget build(BuildContext context) {
    final nextMonth = DateTime.now().month + 1;
    final substract = 31 - DateTime.now().day;
    final days = 31 - substract;
    final start = DateTime.now();
    final end = DateTime(DateTime.now().year, nextMonth, days);
    final ndeshjetFilter =
        Provider.of<NdeshjetItem>(context, listen: false).checkReservations(tapedDate);

    return Scaffold(
      appBar: AppBar(title: Text('Rezervo')),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Card(
            elevation: 6,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Text('Kalendari i orareve te lira per rezervim.')),
          ),
          Container(
            height: 100,
            child: CalendarStrip(
              startDate: start,
              endDate: end,
              onDateSelected: (date) {
                setState(() {
                  tapedDate = date;
                  dateTime = DateFormat.MMMMd().format(date);
                });
                print(dateTime);
              },
            ),
          ),
          Container(
            child: Text(dateTime),
          ),
          Container(
            height: 120,
            child: SingleChildScrollView(
              child: Column(
                children: ndeshjetFilter
                    .map((match) => Text(
                        'Rezervim i lire ne ora ${match.format(context)}.'))
                    .toList(),
              ),
            ),
          ),
          RaisedButton(
            child: Text('Rezervo nje orar!'),
            elevation: 6,
            onPressed: () {},
          ),
        ],
      ),
    ); //Container(height: 100 ,child: Calendarro(startDate: start, endDate: end),),);
  }
}
