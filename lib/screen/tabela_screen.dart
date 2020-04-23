import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class TabelaScreen extends StatelessWidget {
  static const routeName = '/tabela_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('a'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[Text('1')],
      ),
    );
  }
}
