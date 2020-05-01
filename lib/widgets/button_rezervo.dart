import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/ndeshjet.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ndeshjetProv = Provider.of<NdeshjetItem>(context, listen: false);
    final _ndeshjetFilter =
        ndeshjetProv.checkReservations(ndeshjetProv.tapedDate);
    final time = _ndeshjetFilter[ndeshjetProv.selectedIndex];
    final taped = ndeshjetProv.tapedDate;
    return RaisedButton(
      child: Text('Rezervo tani!'),
      elevation: 6,
      onPressed: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Konfirmim!'),
                content: Text(
                    'Konfirmoni rezervimin tuaj. Ora ${time.format(context)}, ${DateFormat.MMMMd('sq').format(taped).toUpperCase()} ditë ${DateFormat.EEEE('sq').format(taped).toUpperCase()}.'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Konfirmo'),
                    onPressed: () {
                      if (_ndeshjetFilter.length == 1) {
                        return;
                      }
                      ndeshjetProv.bookFunc(taped, time, 'Fabian', 4);

                      ndeshjetProv.onSelected(0);

                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('Zgjedhni orar tjetër'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },
    );
  }
}
