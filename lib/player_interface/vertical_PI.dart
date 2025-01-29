import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raccoon_counter/player.dart';
import 'package:raccoon_counter/player_interface/options/color/color_card.dart';
import 'package:raccoon_counter/player_interface/options/options_card.dart';
import 'package:raccoon_counter/player_interface/player_card/interactive_PC.dart';
import 'package:raccoon_counter/player_interface/player_card/vertical/interactive_PCV.dart';

import '../interface_SM/player_interface_cubit.dart';
import '../interface_SM/player_interface_state.dart';

class VerticalPI extends StatelessWidget {
  final Player player;

  const VerticalPI({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayerInterfaceCubit(),
      child: BlocBuilder<PlayerInterfaceCubit, PlayerInterfaceState>(
        builder: (context, state) {
          final cubit = context.read<PlayerInterfaceCubit>();

          return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                PageView(
                  controller: cubit.pageController,
                  onPageChanged: cubit.onPageChanged,
                  children: [
                    OptionsCard(
                      player: player,
                    ),
                    InteractivePC(
                      player: player,
                    ),
                  ],
                ),
                if (state.showPickColorCard)
                  ColorCard(
                    player: player,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}