import 'package:flutter/material.dart';
import '../models/categories.dart';

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
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
              Text(cat.name, style: Theme.of(context).textTheme.headline6),
              Container(
                  child: Icon(cat.icon),
              ),
            ]),
                )),
          ),
        );
      }).toList(),
    );
  }
}
