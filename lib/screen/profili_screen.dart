import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ProfiliScreen extends StatelessWidget {
  static const routeName = '/profili_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profili')),
      drawer: AppDrawer(),
      body: Text('prf'),
    );
  }
}