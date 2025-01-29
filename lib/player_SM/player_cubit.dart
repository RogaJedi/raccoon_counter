import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raccoon_counter/player_SM/player_state.dart';

import '../player.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerState());

  void incrementLife(String playerId) {
    final currentPlayers = Map<String, Player>.from(state.players);
    if (currentPlayers.containsKey(playerId)) {
      currentPlayers[playerId] = currentPlayers[playerId]!.copyWith(
        counter: currentPlayers[playerId]!.counter + 1,
      );
      emit(state.copyWith(players: currentPlayers));
    }
  }

  void decrementLife(String playerId) {
    final currentPlayers = Map<String, Player>.from(state.players);
    if (currentPlayers.containsKey(playerId)) {
      currentPlayers[playerId] = currentPlayers[playerId]!.copyWith(
        counter: currentPlayers[playerId]!.counter - 1,
      );
      emit(state.copyWith(players: currentPlayers));
    }
  }
}