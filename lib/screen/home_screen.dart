import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ndeshjet.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ndeshjet = Provider.of<NdeshjetItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Q.S.Shllaku'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: ndeshjet.ndeshjet.map((ndeshja){
          return Text(ndeshja.user);
        }).toList(),
      ),
    );
  }
}
