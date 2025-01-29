import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raccoon_counter/player.dart';

import '../../../player_SM/player_cubit.dart';
import '../custom_button.dart';
import 'PCV.dart';

class InteractivePCV extends StatelessWidget {
  final Player player;

  const InteractivePCV({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PCV(
          player: player,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              CustomButton(
                borderRad: 8,
                onTap: () {
                  context.read<PlayerCubit>().incrementLife(player.id);
                },
                onLongTap: () {

                },
              ),
              CustomButton(
                borderRad: 8,
                onTap: () {
                  context.read<PlayerCubit>().decrementLife(player.id);
                },
                onLongTap: () {

                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}