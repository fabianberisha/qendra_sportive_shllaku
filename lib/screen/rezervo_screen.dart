import 'package:flutter/material.dart';
import '../widgets/calendar_strip_widget.dart';
import '../widgets/app_drawer.dart';


class RezervoScreen extends StatelessWidget {
  static const routeName = '/rezervo_screen';

  Widget build(BuildContext context) {
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
          Calendar(),      
        ],
      ),
    );
  }
}