import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raccoon_counter/player.dart';
import 'package:raccoon_counter/player_SM/player_state.dart';
import 'package:raccoon_counter/player_interface/options/color/color_template.dart';

import '../../../player_SM/player_cubit.dart';

class ColorDialogV extends StatelessWidget {
  final Player player;

  ColorDialogV({
    super.key,
    required this.player
  });

  final colors = [
    const Color(0xFFFFFFFF),
    const Color(0xFF73E5E5),
    const Color(0xFF7399E5),
    const Color(0xFF7373E5),
    const Color(0xFF9973E5),
    const Color(0xFFBF73E5),
    const Color(0xFFE573E5),
    const Color(0xFFE573BF),
    const Color(0xFFE57399),
    const Color(0xFFE57373),
    const Color(0xFFE59973),
    const Color(0xFFFFC34C),
    const Color(0xFFE5E573),
    const Color(0xFFBFE573),
    const Color(0xFF99E573),
    const Color(0xFF73E573),
    const Color(0xFF73E599),
    const Color(0xFF73E5BF),
    const Color(0xFFB3B3B3),
  ];

  @override
  Widget build(BuildContext context) {

    //TODO: fix turn

    int turn = 0;

    if (player.id == 1) {
      turn = 180;
    }

    Color playerColor = player.color;

    void changeColor(Color newColor) {
      playerColor = newColor;
    }

    return Transform.rotate(
      angle: 0 * 3.14159 / 180,
      child: BlocBuilder<PlayerCubit, PlayerState>(
          builder: (context, state) {
            final currentPlayer = state.players[player.id];

            return AlertDialog(
              backgroundColor: Color(0xFF353535),
              content: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    children: [
                      for (int i = 0; i < 18; i++)
                        Transform.rotate(
                          angle: 90 * 3.14159 / 180,
                          child: GestureDetector(
                            onTap: () {
                              context.read<PlayerCubit>().changeSelectedColor(player.id, colors[i]);
                            },
                            child: ColorTemplate(
                              mainColor: colors[i],
                              borderColor: colors[i] == currentPlayer?.selectedColor
                                  ? colors[i]  // or any other color to indicate selection
                                  : Color(0xFF353535),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (currentPlayer != null) {
                      context.read<PlayerCubit>().changeColor(
                          player.id,
                          currentPlayer.selectedColor
                      );
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Select'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (currentPlayer != null) {
                      context.read<PlayerCubit>().changeSelectedColor(
                          player.id,
                          currentPlayer.color
                      );
                    }
                  },
                  child: const Text('Back'),
                ),
              ],
            );
          }
      ),
    );
  }
}