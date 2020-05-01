import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class Orari {
  final TimeOfDay hour;

  const Orari(
    this.hour,
  );
}

enum Perfundon { Humbje, Barazim, Fitore, NukZgjedh, UnSigned }

class Ndeshja {
  final int id;
  final String user;
  final TimeOfDay hour;
  final DateTime date;
  final String rezultati;
  Perfundon perfundon;

  Ndeshja({
    @required this.user,
    @required this.hour,
    @required this.date,
    @required this.id,
    this.perfundon = Perfundon.UnSigned,
    this.rezultati,
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
    Orari(TimeOfDay(hour: 01, minute: 0)),
  ];

  final _ndeshjet = [
    Ndeshja(
      id: 1,
      user: 'Fabian',
      hour: TimeOfDay(hour: 0, minute: 0),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 2,
      user: 'Fabian',
      hour: TimeOfDay(hour: 20, minute: 0),
      date: DateTime.now(),
    ),
    Ndeshja(
      id: 3,
      user: 'Fabian',
      hour: TimeOfDay(hour: 14, minute: 0),
      date: DateTime.now(),
    ),
  ];

  int selectedIndex = 0;

  void onSelected(int index) {
    selectedIndex = index;
    notifyListeners();
  }


  final String userid = 'Fabian'; //TODO user id generate

  var tapedDate = DateTime.now();

  void onTap(DateTime date) {
    tapedDate = date;
    notifyListeners();
  }

  DateTime get end {
    final nextMonth = DateTime.now().month + 1;
    final substract = 31 - DateTime.now().day;
    final days = 31 - substract;
    return DateTime(DateTime.now().year, nextMonth, days);
  }

  List<Ndeshja> get ndeshjet {
    return [..._ndeshjet];
  }

  List<TimeOfDay> checkReservations(DateTime date) {
    var filtereMatches = _ndeshjet.where((match) => match.date.day == date.day);
    var matchesTime = [];
    filtereMatches.forEach((match) => matchesTime.add(match.hour));
    var freeTime = [];
    orari.forEach((orar) => freeTime.add(orar.hour));
    var output =
        freeTime.where((element) => !matchesTime.contains(element)).toList();
    var reservations = orari.where((el) => output.contains(el.hour)).toList();

    return reservations.map((or) => or.hour).toList();
  }

  void bookFunc(DateTime date, TimeOfDay time, String userid, int id) {
    _ndeshjet.add(Ndeshja(
      id: id, //database id
      user: userid,
      hour: time,
      date: date,
    ));
    notifyListeners();
  }

  var findMatches;

  List<Ndeshja> findMatch(String userid) {
    findMatches = _ndeshjet.where((match) => match.user == userid).toList();
    return findMatches;
  }

  Ndeshja findById(int id) {
    return findMatches.firstWhere((match) => match.id == id);
  }

  List<Ndeshja> finishedMatch() {
    return findMatches.where((match) => match.perfundon);
  }

  List<Ndeshja> filterMatches(String choice) {
    if (choice == 'playing') {
      return findMatches
          .where((match) =>
              match.date.year == DateTime.now().year &&
              match.date.day == DateTime.now().day &&
              match.date.month == DateTime.now().month &&
              match.hour.hour == DateTime.now().hour)
          .toList();
    }

    if (choice == 'soon') {
      return findMatches
          .where((match) =>
              DateTime.now().isBefore(match.date) ||
              (match.date.day == DateTime.now().day &&
                  match.date.month == DateTime.now().month &&
                  match.hour.hour > DateTime.now().hour))
          .toList();
    }

    if (choice == 'finished') {
      return findMatches
          .where((match) =>
              DateTime.now().isAfter(match.date) &&
              DateTime.now().hour > match.hour.hour)
          .toList();
    }
    return findMatches;
  }
}
