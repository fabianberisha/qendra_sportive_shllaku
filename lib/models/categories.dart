import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String route;

  const Category({
    @required this.id,
    @required this.name,
    @required this.route,
  });
}
