import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class RezervoScreen extends StatelessWidget {
  static const routeName = '/rezervo_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rezervo')),
      drawer: AppDrawer(),
      body: Container(width: 200 ,child: Text('rz')),
    );
  }
}