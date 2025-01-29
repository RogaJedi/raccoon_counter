import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raccoon_counter/player_interface/vertical_PI.dart';

import '../player_SM/player_cubit.dart';
import '../player_SM/player_state.dart';


class TWOPA extends StatelessWidget {

  final double aspectRatio;

  TWOPA({
    super.key,
    required this.aspectRatio,
  });

  final List<String> displayedPlayerIds = ['1', '4'];
  final Map<String, int> rotations = {
    '1': 1, // for player 1, rotate 4 quarter turns
    '4': 3, // for player 4, rotate 2 quarter turns
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<PlayerCubit, PlayerState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: displayedPlayerIds.map((playerId) {
                  final player = state.players[playerId]!;
                  return Expanded(
                    child: RotatedBox(
                      quarterTurns: rotations[playerId]!,
                      child: VerticalPI(
                        player: player,
                      ),
                    ),
                  );
                }).toList(),
              ),
              Center(
                child: SizedBox(
                  width: 56.h,
                  height: 56.h,
                  child: IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black),
                    ),
                    onPressed: () {},
                    icon: Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: Icon(
                        Icons.settings_sharp,
                        size: 40.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      )
    );
  }
}

/*
Stack(
        children: [
          Column(
            children: [
              //angle: 180 * 3.14159 / 180,
              Expanded(
                child: RotatedBox(
                  quarterTurns: 4,
                  child: PCV(
                      player: players[0],
                  ),
                ),
              ),
              Expanded(
                child: RotatedBox(
                  quarterTurns: 2,
                  child: PCV(
                    player: players[1],
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: SizedBox(
              width: 56.h,
              height: 56.h,
              child: IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black),
                ),
                onPressed: () {},
                icon: Transform.rotate(
                  angle: 90 * 3.14159 / 180,
                  child: Icon(
                    Icons.settings_sharp,
                    size: 40.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
 */