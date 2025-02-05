import 'package:flutter/material.dart';
import '../player.dart';

class PlayerState {
  final Map<String, Player> players;

  PlayerState({Map<String, Player>? players})
      : players = players ??
      {
        '1': Player(
          id: '1',
          color: Color(0xFF7399E5),
          selectedColor: Color(0xFF7399E5),
          counter: 20,
          pendingIndicator: null,
        ),
        '2': Player(
          id: '2',
          color: Color(0xFFE57373),
          selectedColor: Color(0xFFE57373),
          counter: 20,
          pendingIndicator: null,
        ),
        '3': Player(
          id: '3',
          color: Color(0xFF73E573),
          selectedColor: Color(0xFF73E573),
          counter: 20,
          pendingIndicator: null,
        ),
        '4': Player(
          id: '4',
          color: Color(0xFF9973E5),
          selectedColor: Color(0xFF9973E5),
          counter: 20,
          pendingIndicator: null,
        ),
        '5': Player(
          id: '5',
          color: Color(0xFFE59973),
          selectedColor: Color(0xFFE59973),
          counter: 20,
          pendingIndicator: null,
        ),
        '6': Player(
          id: '6',
          color: Color(0xFFFFC34C),
          selectedColor: Color(0xFFFFC34C),
          counter: 20,
          pendingIndicator: null,
        ),
      };

  PlayerState copyWith({Map<String, Player>? players}) {
    return PlayerState(players: players ?? this.players);
  }
}