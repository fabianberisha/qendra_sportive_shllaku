import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/ndeshjet.dart';

import './screen/home_screen.dart';
import './screen/lajme_screen.dart';
import './screen/ndeshjet_screen.dart';
import './screen/profili_screen.dart';
import './screen/rezervo_screen.dart';
import './screen/tabela_screen.dart';
import './screen/rezultatet_screen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => NdeshjetItem(),
      child: MaterialApp(
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child),          
        title: 'QSShllaku',
        theme: ThemeData(
            primaryColor: Colors.blue,
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontFamily: 'Ubuntu',
                  ),
                  bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  bodyText2: TextStyle(
                    color: Colors.lightBlue.withOpacity(0.6),
                    fontSize: 18,
                  ),
                )),
        home: HomeScreen(),
        routes: {
          TerminetScreen.routeName: (ctx) => TerminetScreen(),
          LajmeScreen.routeName: (ctx) => LajmeScreen(),
          ProfiliScreen.routeName: (ctx) => ProfiliScreen(),
          RezultatetScreen.routeName: (ctx) => RezultatetScreen(),
          TabelaScreen.routeName: (ctx) => TabelaScreen(),
          RezervoScreen.routeName: (ctx) => RezervoScreen(),
        },
      ),
    );
  }
}
