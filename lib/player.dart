import 'package:flutter/material.dart';

class Player {
  final String id;
  final Color color;
  final int counter;

  Player({
    required this.id,
    required this.color,
    required this.counter,
  });

  Player copyWith({
    String? id,
    Color? color,
    int? counter,
  }) {
    return Player(
      id: id ?? this.id,
      color: color ?? this.color,
      counter: counter ?? this.counter,
    );
  }
}