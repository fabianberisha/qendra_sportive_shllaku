import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Perfundon { Humbje, Barazim, Fitore }

class Ndeshja {
  final int id;
  final String user;
  final TimeOfDay hour;
  final DateTime date;
  Perfundon perfundon;
  String rezultati;

  Ndeshja({
    @required this.user,
    @required this.hour,
    @required this.date,
    @required this.id,
    this.perfundon = Perfundon.Humbje,
    this.rezultati,
  });
}

class NdeshjetItem with ChangeNotifier {
  final ndeshjet = [
    Ndeshja(
      id: 1,
      user: 'Fabian',
      hour: TimeOfDay.now(),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 2,
      user: 'Andi',
      hour: TimeOfDay.now(),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 3,
      user: 'Fabian',
      hour: TimeOfDay.now(),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 4,
      user: 'Andi',
      hour: TimeOfDay.now(),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 5,
      user: 'Fabian',
      hour: TimeOfDay.now(),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 6,
      user: 'Fabian',
      hour: TimeOfDay.now(),
      date: DateTime.now(),
    ),
  ];
}
