import 'package:flutter/material.dart';
import '../models/ndeshjet.dart';
import 'package:provider/provider.dart';

class ChooseResult extends StatefulWidget {
  final int id;

  ChooseResult(this.id);

  @override
  _ChooseResultState createState() => _ChooseResultState();
}

class _ChooseResultState extends State<ChooseResult> {
  String _perfundon;
  Map<String, Perfundon> _finish = {
    'Fitore': Perfundon.Fitore,
    'Barazim': Perfundon.Barazim,
    'Humbje': Perfundon.Humbje
  };

  @override
  Widget build(BuildContext context) {
    Ndeshja match = Provider.of<NdeshjetItem>(context).findById(widget.id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DropdownButton(
          hint: Text("Select The Gender"),
          value: _perfundon,
          items: _finish.keys.map((value) {
            return DropdownMenuItem(
              child: Text(value),
              value: value,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _perfundon = value;
              match.perfundon = _finish[value];
            });
          },
        ),
      ],
    );
  }
}
