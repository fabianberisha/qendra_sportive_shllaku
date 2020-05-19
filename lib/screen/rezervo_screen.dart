import 'package:flutter/material.dart';
import '../widgets/calendar_strip_widget.dart';
import '../widgets/app_drawer.dart';

//TODO state managment optimization!!!

class RezervoScreen extends StatelessWidget {
  static const routeName = '/rezervo_screen';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rezervo')),
      drawer: AppDrawer(),
      body: Calendar(),
    );
  }
}
