import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../models/ndeshjet.dart';
import 'package:intl/intl.dart';

class TerminetScreen extends StatelessWidget {
  static const routeName = '/ndeshjet_screen';
  static const userId = 'Fabian';

  @override
  Widget build(BuildContext context) {
    final userMatches = Provider.of<NdeshjetItem>(context).findMatch(userId);
    return Scaffold(
      appBar: AppBar(title: Text('Ndeshjet')),
      drawer: AppDrawer(),
      body: Container(
        height: 200,
        child: Column(
          children: userMatches.map((match) {
            return Row(
              children: <Widget>[
                Text(match.hour.toString()),
                Text(match.user),
                Text(DateFormat.MMMMd().format(match.date)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
