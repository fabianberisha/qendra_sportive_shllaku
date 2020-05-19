import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

import '../models/ndeshjet.dart';
import '../widgets/app_drawer.dart';
import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final matches = Provider.of<NdeshjetItem>(context, listen: false);
    matches.findMatch(matches.userid);

    return Scaffold(
      appBar: AppBar(
        title: Text('Q.S.Shllaku'),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Perdoruesi: ${matches.userid}'),
              Text('Info shtese p.sh data')
            ],
          ),
          HomeBody(),
        ],
      ),
    );
  }
}
