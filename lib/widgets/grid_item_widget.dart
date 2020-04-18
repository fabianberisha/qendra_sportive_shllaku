import 'package:flutter/material.dart';

class GridItemWidget extends StatelessWidget {
  final String title;
  final String id;
  final String route;

  GridItemWidget(this.title, this.id, this.route);

  //final thisCategory = CATEGORIES.firstWhere((x) => id);

  void showCategory(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.body1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.7),
              Colors.blue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
