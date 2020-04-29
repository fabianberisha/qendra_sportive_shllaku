import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../models/ndeshjet.dart';
import 'package:intl/intl.dart';

import '../widgets/tab_ndeshjet.dart';

class TerminetScreen extends StatefulWidget {
  static const routeName = '/ndeshjet_screen';
  static const userId = 'Fabian';

  @override
  _TerminetScreenState createState() => _TerminetScreenState();
}

class _TerminetScreenState extends State<TerminetScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(DateTime.now().hour);
    final userMatches =
        Provider.of<NdeshjetItem>(context).findMatch(TerminetScreen.userId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ndeshjet'),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: <Widget>[
            Tab(
              text: 'Duke u luajtur',
            ),
            Tab(
              text: 'Te paluajtura',
            ),
            Tab(
              text: 'Te perfunduara',
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: AppDrawer(),
      body: TabBarView(
        children: [
           TabNdeshjet(
            userMatches
                .where((match) =>
                    match.date.day == DateTime.now().day &&
                    match.date.month == DateTime.now().month &&
                    match.hour.hour == DateTime.now().hour)
                .toList(),
          ),
          TabNdeshjet(
            userMatches
                .where((match) =>
                    match.date.day == DateTime.now().day &&
                    match.date.month == DateTime.now().month &&
                    match.hour.hour > DateTime.now().hour)
                .toList(),
          ),
          TabNdeshjet(userMatches
              .where((match) =>
                  match.date.day <= DateTime.now().day &&
                  match.date.month <= DateTime.now().month &&
                  match.hour.hour < DateTime.now().hour)
              .toList()),
        ],
        controller: _tabController,
      ),
    );
  }
}
