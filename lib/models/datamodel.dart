import 'package:flutter/foundation.dart';

class Expances {
  final String id;
  final String title;
  final double price;
  final DateTime date;

  Expances({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.date,
  });
}