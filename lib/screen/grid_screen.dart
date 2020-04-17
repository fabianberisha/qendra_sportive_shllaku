import 'package:flutter/material.dart';
import '../data/termin_data.dart';
import '../widgets/grid_item_widget.dart';

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(vertical:80, horizontal:40),
      children: CATEGORIES.map((cat) {
        return Container(margin: EdgeInsets.all(10),child: GridItemWidget(cat.name, cat.id));
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
