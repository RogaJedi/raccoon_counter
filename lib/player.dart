import 'package:flutter/material.dart';

class Player {
  final String id;
  final Color color;
  final int counter;
  final int? pendingIndicator;

  Player({
    required this.id,
    required this.color,
    required this.counter,
    this.pendingIndicator,
  });

  Player copyWith({
    String? id,
    Color? color,
    int? counter,
    int? pendingIndicator,
  }) {
    return Player(
      id: id ?? this.id,
      color: color ?? this.color,
      counter: counter ?? this.counter,
      pendingIndicator: pendingIndicator,
    );
  }
}