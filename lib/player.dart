import 'package:flutter/material.dart';
import 'package:raccoon_counter/player_interface/options/extra_counters/extra_counter.dart';

class Player {
  final String id;
  final Color color;
  final Color selectedColor;
  final int counter;
  final int? pendingIndicator;
  final Map<String, ExtraCounter> extraCounters;

  Player({
    required this.id,
    required this.color,
    required this.selectedColor,
    required this.counter,
    this.pendingIndicator,
    Map<String, ExtraCounter>? symbolCounters,
  }) : extraCounters = symbolCounters ?? {};

  Player copyWith({
    String? id,
    Color? color,
    Color? selectedColor,
    int? counter,
    int? pendingIndicator,
    Map<String, ExtraCounter>? symbolCounters,
  }) {
    return Player(
      id: id ?? this.id,
      color: color ?? this.color,
      selectedColor: selectedColor ?? this.selectedColor,
      counter: counter ?? this.counter,
      pendingIndicator: pendingIndicator,
      symbolCounters: symbolCounters ?? this.extraCounters,
    );
  }
}