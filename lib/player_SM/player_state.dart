import 'package:flutter/material.dart';
import '../player.dart';

class PlayerState {
  final Map<String, Player> players;

  PlayerState({Map<String, Player>? players})
      : players = players ??
      {
        '1': Player(
          id: '1',
          color: Colors.blue,
          counter: 20,
        ),
        '2': Player(
          id: '2',
          color: Colors.red,
          counter: 20,
        ),
        '3': Player(
          id: '3',
          color: Colors.green,
          counter: 20,
        ),
        '4': Player(
          id: '4',
          color: Colors.purple,
          counter: 20,
        ),
        '5': Player(
          id: '5',
          color: Colors.orange,
          counter: 20,
        ),
        '6': Player(
          id: '6',
          color: Colors.yellow,
          counter: 20,
        ),
      };

  PlayerState copyWith({Map<String, Player>? players}) {
    return PlayerState(players: players ?? this.players);
  }
}