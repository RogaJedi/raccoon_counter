
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:raccoon_counter/interface_SM/player_interface_cubit.dart';
import 'package:raccoon_counter/player_interface/options/color/color_dialog_V.dart';

import '../../player.dart';
import '../../player_SM/player_cubit.dart';
import '../../player_SM/player_state.dart';

class OptionsCard extends StatelessWidget {
  final Player player;

  const OptionsCard({
    super.key,
    required this.player
  });


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Card(
            color: const Color(0xFF353535),
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Transform.rotate(
                angle: 0 * 3.14159 / 180,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Transform.rotate(
                            angle: 90 * 3.14159 / 180,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/add_counter.svg',
                                    height: 70.h,
                                  ),
                                ),
                                Text(
                                  "ADD COUNTER",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.rotate(
                            angle: 90 * 3.14159 / 180,
                            child: Column(
                              children: [
                                BlocBuilder<PlayerCubit, PlayerState>(
                                    builder: (context, state) {
                                      return IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ColorDialogV(player: player,);
                                              }
                                          );
                                        },
                                        icon: SvgPicture.asset(
                                          'assets/white.svg',
                                          height: 70.h,
                                          color: player.color,
                                        ),
                                      );
                                    }
                                ),
                                Text(
                                  "COLOR",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                ),
              ),
            ),
          );
        }
    );
  }
}