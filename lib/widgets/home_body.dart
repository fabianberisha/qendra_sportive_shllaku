import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/ndeshjet.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nextMatch =
        Provider.of<NdeshjetItem>(context).filterMatches('soon')[0];
    final estimateTs = DateTime(nextMatch.date.year, nextMatch.date.month,
        nextMatch.date.day, nextMatch.hour.hour, 0, 0);


    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          DateFormat format = DateFormat("mm:ss");
          int now = DateTime.now().millisecondsSinceEpoch;
          Duration remaining =
              Duration(milliseconds: estimateTs.millisecondsSinceEpoch - now);
          var dateString =
              '${remaining.inHours}:${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
          print(dateString);
          return Container(
            color: Colors.greenAccent.withOpacity(0.3),
            alignment: Alignment.center,
            child: Text(dateString),
          );
        });

    // return Column(
    //   children: <Widget>[
    //     Card(
    //       child: Text('Counter down time till next match.'), //TODO
    //     ),
    //     SizedBox(
    //       height: 100,
    //     ),
    //     Column(
    //       children: <Widget>[
    //         Text('Rezultatet e fundit:'),
    //         Card(
    //             elevation: 6,
    //             child: Container(
    //               padding: EdgeInsets.all(5),
    //               child: Text(
    //                 'WWWWW',
    //                 style: TextStyle(color: Colors.green),
    //               ),
    //             ))
    //       ],
    //     ),
    //     SizedBox(
    //       height: 100,
    //     ),
    //     Text('Ndeshjet e paluajtura'),
    //     SizedBox(
    //       height: 200,
    //     ),
    //   ],
    // );
  }
}
