import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../player.dart';
import '../../player_SM/player_cubit.dart';
import 'PC.dart';
import 'custom_button.dart';

class InteractivePC extends StatelessWidget {
  final Player player;

  const InteractivePC({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PC(
          player: player,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              CustomButton(
                borderRad: 8,
                onTap: () {
                  context.read<PlayerCubit>().decrementLife(player.id);
                },
                onLongTap: () {

                },
              ),
              CustomButton(
                borderRad: 8,
                onTap: () {
                  context.read<PlayerCubit>().incrementLife(player.id);
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