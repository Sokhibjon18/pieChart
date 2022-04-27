import 'dart:math';

import 'package:flutter/material.dart';

class CardModel {
  final String name;
  double amout;
  final Color color;
  final bool overDue;

  CardModel({
    required this.name,
    required this.amout,
    required this.color,
    this.overDue = false,
  });

  factory CardModel.mocked() {
    Random ran = Random();

    Color getColor() {
      switch (ran.nextInt(5)) {
        case 0:
          return Colors.amber;
        case 1:
          return Colors.red;
        case 2:
          return Colors.green;
        case 3:
          return Colors.blue;
        default:
          return Colors.deepPurple;
      }
    }

    return CardModel(
      name: (ran.nextInt(8999) + 1000).toString(),
      amout: (ran.nextDouble() * 100000).round() / 100 + 100,
      color: getColor(),
    );
  }
}
