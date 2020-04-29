import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import '../models/ndeshjet.dart';

class MatchAvailable extends StatefulWidget {
  final DateTime tapedDate;

  MatchAvailable(this.tapedDate);

  @override
  _MatchAvailableState createState() => _MatchAvailableState();
}

class _MatchAvailableState extends State<MatchAvailable> {
  int _selectedIndex = 0;

  void _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    
    final _ndeshjetFilter =
        Provider.of<NdeshjetItem>(context, listen: false).checkReservations(widget.tapedDate);
    var time = _ndeshjetFilter[_selectedIndex];
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
                            onTap: () => _onSelected(index),
                            child: Card(
                              color: _selectedIndex != null &&
                                      _selectedIndex == index
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
        RaisedButton(
          child: Text('Rezervo tani!'),
          elevation: 6,
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  
                  return AlertDialog(
                    
                    title: Text(
                        'Konfirmoni rezervimin tuaj. Ora ${_ndeshjetFilter[_selectedIndex].format(context)}, ${DateFormat.MMMMd('sq').format(widget.tapedDate)} ditë ${DateFormat.EEEE('sq').format(widget.tapedDate)}.'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Konfirmo'),
                        onPressed: () {
                          if (_ndeshjetFilter.length == 1) {
                            return;
                          }
                          Provider.of<NdeshjetItem>(context, listen: false)
                              .bookFunc(widget.tapedDate, time, 'Fabian', 4);

                          setState(() {
                            _selectedIndex = 0;
                          });

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
        ),
      ],
    );
  }
}
