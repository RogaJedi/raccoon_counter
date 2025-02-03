import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raccoon_counter/player_SM/player_state.dart';

import '../player.dart';

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

      // Clear the indicator after delay
      _startDebounceTimer(playerId);
    }
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}