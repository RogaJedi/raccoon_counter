import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raccoon_counter/player_SM/player_state.dart';

import '../player.dart';
import '../player_interface/options/extra_counters/extra_counter.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerState());

  Timer? _debounceTimer;

  void _startDebounceTimer(String playerId) {
    final currentPlayers = Map<String, Player>.from(state.players);
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      if(currentPlayers.containsKey(playerId)) {
        currentPlayers[playerId] = currentPlayers[playerId]!.copyWith(
          pendingIndicator: null
        );
        emit(state.copyWith(players: currentPlayers));
      }
    });
  }

  void incrementLife(String playerId) {
    final currentPlayers = Map<String, Player>.from(state.players);
    if (currentPlayers.containsKey(playerId)) {
      final currentPending = currentPlayers[playerId]?.pendingIndicator ?? 0;
      currentPlayers[playerId] = currentPlayers[playerId]!.copyWith(
        counter: currentPlayers[playerId]!.counter + 1,
        pendingIndicator: currentPending + 1,
      );
      emit(state.copyWith(players: currentPlayers));

      _startDebounceTimer(playerId);
    }
  }

  void decrementLife(String playerId) {
    final currentPlayers = Map<String, Player>.from(state.players);
    if (currentPlayers.containsKey(playerId)) {
      final currentPending = currentPlayers[playerId]?.pendingIndicator ?? 0;
      currentPlayers[playerId] = currentPlayers[playerId]!.copyWith(
        counter: currentPlayers[playerId]!.counter - 1,
        pendingIndicator: currentPending - 1,
      );
      emit(state.copyWith(players: currentPlayers));

      _startDebounceTimer(playerId);
    }
  }

  void changeColor(String playerId, Color color) {
    final currentPlayers = Map<String, Player>.from(state.players);
    if (currentPlayers.containsKey(playerId)) {
      currentPlayers[playerId] = currentPlayers[playerId]!.copyWith(
        color: color,
        selectedColor: color, // Update both color and selectedColor
      );
      emit(state.copyWith(players: currentPlayers));
    }
  }

  void changeSelectedColor(String playerId, Color color) {
    final currentPlayers = Map<String, Player>.from(state.players);
    if (currentPlayers.containsKey(playerId)) {
      currentPlayers[playerId] = currentPlayers[playerId]!.copyWith(
        selectedColor: color,
      );
      emit(state.copyWith(players: currentPlayers));
    }
  }

  void addSymbolCounter(String playerId, String symbol) {
    final updatedPlayers = Map<String, Player>.from(state.players);
    final player = updatedPlayers[playerId];
    if (player != null) {
      final updatedSymbolCounters = Map<String, ExtraCounter>.from(player.extraCounters);
      updatedSymbolCounters[symbol] = ExtraCounter(symbol: symbol);
      updatedPlayers[playerId] = player.copyWith(
        symbolCounters: updatedSymbolCounters,
      );
      emit(state.copyWith(players: updatedPlayers));
    }
  }

  void removeSymbolCounter(String playerId, String symbol) {
    final updatedPlayers = Map<String, Player>.from(state.players);
    final player = updatedPlayers[playerId];
    if (player != null) {
      final updatedSymbolCounters = Map<String, ExtraCounter>.from(player.extraCounters);
      updatedSymbolCounters.remove(symbol);
      updatedPlayers[playerId] = player.copyWith(
        symbolCounters: updatedSymbolCounters,
      );
      emit(state.copyWith(players: updatedPlayers));
    }
  }

  void incrementSymbolCounter(String playerId, String symbol) {
    final updatedPlayers = Map<String, Player>.from(state.players);
    final player = updatedPlayers[playerId];
    if (player != null) {
      final symbolCounter = player.extraCounters[symbol];
      if (symbolCounter != null) {
        final updatedSymbolCounters = Map<String, ExtraCounter>.from(player.extraCounters);
        updatedSymbolCounters[symbol] = symbolCounter.copyWith(
          count: symbolCounter.count + 1,
        );
        updatedPlayers[playerId] = player.copyWith(
          symbolCounters: updatedSymbolCounters,
        );
        emit(state.copyWith(players: updatedPlayers));
      }
    }
  }

  void decrementSymbolCounter(String playerId, String symbol) {
    final updatedPlayers = Map<String, Player>.from(state.players);
    final player = updatedPlayers[playerId];
    if (player != null) {
      final symbolCounter =

      player.extraCounters[symbol];
      if (symbolCounter != null) {
        final updatedSymbolCounters = Map<String, ExtraCounter>.from(player.extraCounters);
        updatedSymbolCounters[symbol] = symbolCounter.copyWith(
          count: symbolCounter.count - 1,
        );
        updatedPlayers[playerId] = player.copyWith(
          symbolCounters: updatedSymbolCounters,
        );
        emit(state.copyWith(players: updatedPlayers));
      }
    }
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}