import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raccoon_counter/interface_SM/player_interface_state.dart';

class PlayerInterfaceCubit extends Cubit<PlayerInterfaceState> {
  final PageController pageController;

  PlayerInterfaceCubit()
      : pageController = PageController(initialPage: 1),
        super(PlayerInterfaceState());

  void onPageChanged(int page) {
    emit(state.copyWith(currentPage: page));
  }

  void togglePickColorCard() {
    emit(state.copyWith(showPickColorCard: !state.showPickColorCard));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}