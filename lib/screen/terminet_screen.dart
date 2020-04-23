import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class TerminetScreen extends StatelessWidget {
  static const routeName = '/ndeshjet_screen';
  static const user = 'Fabian';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ndeshjet')),
      drawer: AppDrawer(),
      body: Container(
        height: 200,
        child: Column(

        ),
      ),
    );
  }
}
