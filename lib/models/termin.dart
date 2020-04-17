import 'package:flutter/foundation.dart';

class Termin {
  final String nameOfThePerson;
  final int hour;
  final double date;

  const Termin({
    @required this.nameOfThePerson,
    @required this.hour,
    @required this.date,
  });
}
