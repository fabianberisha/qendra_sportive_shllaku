import 'package:flutter/material.dart';
import '../models/ndeshjet.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';


class TabNdeshjet extends StatefulWidget {
  final List<Ndeshja> userMatches;

  TabNdeshjet(this.userMatches);

  @override
  _TabNdeshjetState createState() => _TabNdeshjetState();
}

class _TabNdeshjetState extends State<TabNdeshjet> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<NdeshjetItem>(context);
    return Container(
      height: 400,
      child: Column(
        children: widget.userMatches.map((match) {
          return Card(
            elevation: 8,
            child: ListTile(
              leading: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  match.hour.format(context),
                  style: Theme.of(context).textTheme.body2,
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
              trailing: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Pending'),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
