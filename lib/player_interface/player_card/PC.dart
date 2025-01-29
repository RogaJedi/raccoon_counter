import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raccoon_counter/player.dart';

class PC extends StatelessWidget {
  final Player player;

  const PC({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      color: player.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: Text(
                "-",
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.white,
                ),
              ),
            ),
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: SizedBox(
                width: 200.h,
                height: 200.h,
                child: Center(
                  child: Text(
                    player.counter.toString(),
                    style: TextStyle(
                      fontSize: 110.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: Text(
                "+",
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}