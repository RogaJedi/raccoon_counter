import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raccoon_counter/player.dart';

import '../player_card/vertical/PCV.dart';

Player player1 = Player(
    counter: 20,
    color: Color(0xFF67E55C),
    id: 0);

Player player2 = Player(
    counter: 20,
    color: Color(0xFFFFC34D),
    id: 1);

class TWOPA extends StatelessWidget {

  final double aspectRatio;

  TWOPA({super.key,
    required this.aspectRatio,

  });

  final List<Player> players = [player1, player2];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
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
    );
  }
}