import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raccoon_counter/player.dart';
import 'package:raccoon_counter/player_SM/player_cubit.dart';
import 'package:raccoon_counter/player_SM/player_state.dart';

class CountersDialogV extends StatelessWidget {
  final Player player;

  CountersDialogV({
    super.key,
    required this.player
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PlayerCubit, PlayerState>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: Color(0xFF353535),
          title: Text("Add counters"),
          content: SizedBox(
            width: double.maxFinite,
            child: Center(
              child: Container(
                color: Color(0xff353535),
              ),
            ),
          ),
        );
      }
    );
  }
}