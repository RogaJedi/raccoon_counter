import 'package:flutter/material.dart';

class Player {
  final String id;
  final Color color;
  final Color selectedColor;
  final int counter;
  final int? pendingIndicator;

  Player({
    required this.id,
    required this.color,
    required this.selectedColor,
    required this.counter,
    this.pendingIndicator,
  });

  Player copyWith({
    String? id,
    Color? color,
    Color? selectedColor,
    int? counter,
    int? pendingIndicator,
  }) {
    return Player(
      id: id ?? this.id,
      color: color ?? this.color,
      selectedColor: selectedColor ?? this.selectedColor,
      counter: counter ?? this.counter,
      pendingIndicator: pendingIndicator,
    );
  }
}