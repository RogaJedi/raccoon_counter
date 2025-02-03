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
          pendingIndicator: null,
        ),
        '2': Player(
          id: '2',
          color: Colors.red,
          counter: 20,
          pendingIndicator: null,
        ),
        '3': Player(
          id: '3',
          color: Colors.green,
          counter: 20,
          pendingIndicator: null,
        ),
        '4': Player(
          id: '4',
          color: Colors.purple,
          counter: 20,
          pendingIndicator: null,
        ),
        '5': Player(
          id: '5',
          color: Colors.orange,
          counter: 20,
          pendingIndicator: null,
        ),
        '6': Player(
          id: '6',
          color: Colors.yellow,
          counter: 20,
          pendingIndicator: null,
        ),
      };

  PlayerState copyWith({Map<String, Player>? players}) {
    return PlayerState(players: players ?? this.players);
  }
}