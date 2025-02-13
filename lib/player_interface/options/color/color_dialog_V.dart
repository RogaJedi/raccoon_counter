import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raccoon_counter/player.dart';
import 'package:raccoon_counter/player_SM/player_state.dart';
import 'package:raccoon_counter/player_interface/options/color/color_template.dart';
import 'package:smooth_corner/smooth_corner.dart';

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

    return BlocBuilder<PlayerCubit, PlayerState>(
        builder: (context, state) {
          final currentPlayer = state.players[player.id];

          return AlertDialog(
            backgroundColor: Color(0xFF1E1E1E),
            title: Text(
                "Pick a color",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.sp,
              ),
            ),
            content: SmoothContainer(
              width: 300.w,
              height: 469.h,
              smoothness: 0.6,
              borderRadius: BorderRadius.circular(20),
              child: SmoothContainer(
                color: Color(0xff353535),
                width: 252.w,
                height: 292.h,
                smoothness: 0.6,
                borderRadius: BorderRadius.circular(15),
                child: SingleChildScrollView(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 11,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    children: [
                      for (Color color in colors)
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              context.read<PlayerCubit>().changeSelectedColor(player.id, color);
                            },
                            child: ColorTemplate(
                              mainColor: color,
                              borderColor: color == currentPlayer?.selectedColor
                                  ? color
                                  : Color(0xFF353535),
                            ),
                          ),
                        )
                    ],
                  ),
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
    );
  }
}