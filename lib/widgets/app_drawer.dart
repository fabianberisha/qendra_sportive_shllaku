import 'package:flutter/material.dart';
import 'app_category.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(children: <Widget>[
      Container(margin: EdgeInsets.all(50), child: Text('Pershendetje User'),),
      AppCategory(),
    ],));
  }
}
