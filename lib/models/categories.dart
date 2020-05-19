import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String route;
  final IconData icon;

  Category({
    @required this.id,
    @required this.name,
    @required this.route,
    @required this.icon,
  });
}

final categories = [
  Category(
    id: 'c0',
    name: 'Home',
    route: '/',
    icon: Icons.home,
  ),
  // Category(
  //   id: 'c1',
  //   name: 'Profili',
  //   route: '/profili_screen',
  //   icon: Icons.people,
  // ),
  Category(
    id: 'c2',
    name: 'Ndeshjet',
    route: '/ndeshjet_screen',
    icon: Icons.timelapse,
  ),
  Category(
    id: 'c3',
    name: 'Rezervo',
    route: '/rezervo_screen',
    icon: Icons.touch_app,
  ),
  // Category(
  //   id: 'c4',
  //   name: 'Lajme',
  //   route: '/lajme_screen',
  //   icon: Icons.notifications,
  // ),
  // Category(
  //   id: 'c5',
  //   name: 'Rezultatet',
  //   route: '/rezultatet_screen',
  //   icon: Icons.share,
  // ),
  // Category(
  //   id: 'c6',
  //   name: 'Tabela',
  //   route: '/tabela_screen',
  //   icon: Icons.table_chart,
  // ),
];
