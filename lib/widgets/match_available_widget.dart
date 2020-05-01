import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import '../models/ndeshjet.dart';
import '../widgets/button_rezervo.dart';

class MatchAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final ndeshjetProv = Provider.of<NdeshjetItem>(context, listen: false);
    final _ndeshjetFilter =
        ndeshjetProv.checkReservations(ndeshjetProv.tapedDate);
    return Column(
      children: <Widget>[
        Container(
          height: 250,
          width: 300,
          child: _ndeshjetFilter.isEmpty || _ndeshjetFilter.length == 1
              ? Column(
                  children: <Widget>[
                    Text(
                      'Na vjen keq, nuk ka orare te lira.',
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                    Text(
                      'Provoni nje date tjeter.',
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                  ],
                )
              : ListView.builder(
                  itemBuilder: ((ctx, index) {
                    return index != (_ndeshjetFilter.length - 1)
                        ? GestureDetector(
                            onTap: () => ndeshjetProv.onSelected(index),
                            child: Card(
                              color: ndeshjetProv.selectedIndex != null &&
                                      ndeshjetProv.selectedIndex == index
                                  ? Colors.lightGreen
                                  : Colors.white,
                              elevation: 8,
                              child: ListTile(
                                leading: Icon(
                                  Icons.event_available,
                                  color: Colors.green,
                                ),
                                title: Text('Rezervim i lirë'),
                                subtitle: Text(
                                  'Available',
                                  style: TextStyle(
                                      color: Colors.green.withOpacity(0.7)),
                                ),
                                trailing: Text(
                                    '${_ndeshjetFilter[index].format(context)}'),
                              ),
                            ),
                          )
                        : Text('');
                  }),
                  itemCount: _ndeshjetFilter.length,
                ),
        ),
        Button()
      ],
    );
  }
}
