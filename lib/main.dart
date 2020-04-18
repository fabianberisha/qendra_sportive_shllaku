import 'package:flutter/material.dart';
import './screen/lajme_screen.dart';
import './screen/terminet_screen.dart';
import './screen/profili_screen.dart';
import './screen/grid_screen.dart';
import './screen/rezervo_screen.dart';
import './screen/tabela_screen.dart';
import './screen/rezultatet_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QSShllaku',
      theme: ThemeData(
          primaryColor: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                body1: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                body2: TextStyle(
                  color: Colors.lightBlue.withOpacity(0.6),
                  fontSize: 18,
                ),
              )),
      home: Menu(),
      routes: {
        TerminetScreen.routeName: (ctx) => TerminetScreen(),
        LajmeScreen.routeName: (ctx) => LajmeScreen(),
        ProfiliScreen.routeName: (ctx) => ProfiliScreen(),
        RezultatetScreen.routeName: (ctx) => RezultatetScreen(),
        TabelaScreen.routeName: (ctx) => TabelaScreen(),
        RezervoScreen.routeName: (ctx) => RezervoScreen(),
      },
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qendra Sportive Shllaku'),
      ),
      body: GridScreen(),
    );
  }
}
