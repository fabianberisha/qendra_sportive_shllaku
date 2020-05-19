import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/result_widget.dart';
import '../models/ndeshjet.dart';
import 'package:intl/date_symbol_data_local.dart';

class TabNdeshjet extends StatelessWidget {
  final List<Ndeshja> userMatches;

  TabNdeshjet(
    this.userMatches,
  );

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Container(
      height: 400,
      child: Column(
        children: userMatches.map((match) {
          return Card(
            elevation: 8,
            child: ListTile(
              leading: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  match.hour.format(context),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              subtitle: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  DateFormat.MMMMd('sq').format(match.date).toUpperCase(),
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ),
              ),
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  match.date.day == (DateTime.now().day + 1)
                      ? 'Nesër'
                      : match.date.day == DateTime.now().day
                          ? 'Sot'
                          : DateFormat.EEEE('sq')
                              .format(match.date)
                              .toUpperCase(),
                ),
              ),
              trailing: (match.perfundon == Perfundon.UnSigned &&
                      Provider.of<NdeshjetItem>(context, listen: false)
                          .filterMatches('finished')
                          .contains(match))
                  ? ChooseResult(match.id)
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: match.perfundon == Perfundon.Fitore
                          ? Text('W', style: TextStyle(color: Colors.green))
                          : match.perfundon == Perfundon.Barazim
                              ? Text('D')
                              : match.perfundon == Perfundon.Humbje
                                  ? Text('L', style: TextStyle(color: Colors.red))
                                  : Text('')),
            ),
          );
        }).toList(),
      ),
    );
  }
}
