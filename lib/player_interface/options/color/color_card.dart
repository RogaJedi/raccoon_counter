import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../interface_SM/player_interface_cubit.dart';
import '../../../player.dart';

class ColorCard extends StatelessWidget {
  final Player player;

  const ColorCard({
    super.key,
    required this.player
  });


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Card(
            color: Color(0xFF353535),
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Transform.rotate(
                angle: 0 * 3.14159 / 180,
                child: ListView(
                  children: [
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<PlayerInterfaceCubit>().togglePickColorCard();
                            },
                            icon: SvgPicture.asset(
                              'assets/back.svg',
                              height: 70.h,
                            ),
                          ),
                          Text(
                            "BACK",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

              ),

            ),
          );
        }
    );
  }
}