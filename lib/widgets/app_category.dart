import 'package:flutter/material.dart';
import '../providers/categories.dart';

class AppCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: categories.map((cat) {
        return Container(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(cat.route);
            },
            child: Card(
                child: ListTile(
              leading: Text(cat.name),
              title: Container(
                child: Icon(cat.icon),
              ),
            )),
          ),
        );
      }).toList(),
    );
  }
}
