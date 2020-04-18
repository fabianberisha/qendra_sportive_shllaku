import 'package:flutter/material.dart';
import '../data/termin_data.dart';

class TerminetScreen extends StatelessWidget {
  static const routeName = '/terminet_screen';
  static const user = 'Fabian';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terminet')),
      body: Container(
        height: 200,
        child: Column(
          children: TERMINET.map((termin) {
            return Row(
              children: <Widget>[
                Text(termin.nameOfThePerson),
                SizedBox(
                  width: 5,
                ),
                Text(termin.hour.toString()),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
