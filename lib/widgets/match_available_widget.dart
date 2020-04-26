import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ndeshjet.dart';

class MatchAvailable extends StatefulWidget {
  final DateTime tapedDate;

  MatchAvailable(this.tapedDate);

  @override
  _MatchAvailableState createState() => _MatchAvailableState();
}

class _MatchAvailableState extends State<MatchAvailable> {
  int _selectedIndex;
  TimeOfDay time;

  _onSelected(int index) {
     setState(() {
       _selectedIndex = index;
       
     });
  }

  @override
  Widget build(BuildContext context) {
    final ndeshjetFilter = Provider.of<NdeshjetItem>(context, listen: false)
        .checkReservations(widget.tapedDate);

    return Column(
      children: <Widget>[
        Container(
          height: 250,
          width: 300,
          child: ndeshjetFilter.isEmpty
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
                    return GestureDetector(
                      onTap: () => _onSelected(index),
                      child: Card(
                        color: _selectedIndex != null && _selectedIndex == index
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
                            style:
                                TextStyle(color: Colors.green.withOpacity(0.7)),
                          ),
                          trailing:
                              Text('${ndeshjetFilter[index].format(context)}'),
                        ),
                      ),
                    );
                  }),
                  itemCount: ndeshjetFilter.length,
                ),
        ),
        RaisedButton(
          child: Text('Rezervo tani!'),
          elevation: 6,
          onPressed: () {
            Provider.of<NdeshjetItem>(context).bookFunc(widget.tapedDate, time, 'user', 4);

          },
        ),
      ],
    );
  }
}
