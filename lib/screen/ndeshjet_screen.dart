import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../models/ndeshjet.dart';

import '../widgets/tab_ndeshjet.dart';

class TerminetScreen extends StatefulWidget {
  static const routeName = '/ndeshjet_screen';

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
    final matches = Provider.of<NdeshjetItem>(context);
    matches.findMatch(matches
        .userid); //TODO change matches head destination that all widgets can listen

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
            matches.filterMatches('playing'),
          ),
          TabNdeshjet(
            matches.filterMatches('soon'),
          ),
          TabNdeshjet(
            matches.filterMatches('finished'),
          )
        ],
        controller: _tabController,
      ),
    );
  }
}
