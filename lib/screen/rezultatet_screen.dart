import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class RezultatetScreen extends StatelessWidget {
  static const routeName = '/rezultatet_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rezultatet')),
      drawer: AppDrawer(),
      body: Text('TScreen'),
    );
  }
}
