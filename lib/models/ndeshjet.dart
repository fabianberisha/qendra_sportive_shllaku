import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Orari {
  final TimeOfDay hour;

  const Orari(
    this.hour,
  );
}

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
    this.rezultati = '',
  });
}

class NdeshjetItem with ChangeNotifier {
  final List<Orari> orari = [
    Orari(TimeOfDay(hour: 12, minute: 0)),
    Orari(TimeOfDay(hour: 13, minute: 0)),
    Orari(TimeOfDay(hour: 14, minute: 0)),
    Orari(TimeOfDay(hour: 15, minute: 0)),
    Orari(TimeOfDay(hour: 16, minute: 0)),
    Orari(TimeOfDay(hour: 17, minute: 0)),
    Orari(TimeOfDay(hour: 18, minute: 0)),
    Orari(TimeOfDay(hour: 19, minute: 0)),
    Orari(TimeOfDay(hour: 20, minute: 0)),
    Orari(TimeOfDay(hour: 21, minute: 0)),
    Orari(TimeOfDay(hour: 22, minute: 0)),
    Orari(TimeOfDay(hour: 23, minute: 0)),
    Orari(TimeOfDay(hour: 24, minute: 0)),
  ];

  final _ndeshjet = [
    Ndeshja(
      id: 1,
      user: 'Fabian',
      hour: TimeOfDay(hour: 12, minute: 0),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 2,
      user: 'Andi',
      hour: TimeOfDay(hour: 13, minute: 0),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 3,
      user: 'Fabian',
      hour: TimeOfDay(hour: 14, minute: 0),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 4,
      user: 'Andi',
      hour: TimeOfDay(hour: 18, minute: 0),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 5,
      user: 'Fabian',
      hour: TimeOfDay(hour: 15, minute: 0),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 6,
      user: 'Fabian',
      hour: TimeOfDay(hour: 16, minute: 0),
      date: DateTime.now(),
    ),
  ];
  List<Ndeshja> get ndeshjet {
    return [..._ndeshjet];
  }

  List<TimeOfDay> checkReservations(DateTime date) {
    var filtereMatches = _ndeshjet.where((match) => match.date.day == date.day);
    var matchesTime = [];
    filtereMatches.forEach((match) => matchesTime.add(match.hour));
    var freeTime = [];
    orari.forEach((orar) => freeTime.add(orar.hour));
    var output = freeTime.where((element) => !matchesTime.contains(element)).toList();

    var reservations = orari.where((el) => output.contains(el.hour)).toList();
    
    print(reservations);

    return reservations.map((or) => or.hour).toList();
  }

  List<Ndeshja> findMatch(DateTime date) {
    return _ndeshjet
        .where((match) =>
            DateFormat.MMMMd().format(match.date) ==
            DateFormat.MMMMd().format(date))
        .toList();
  }
}