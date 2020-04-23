import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class LajmeScreen extends StatelessWidget {
  static const routeName = '/lajme_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lajme')),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'ljm',
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
