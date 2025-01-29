import 'package:flutter/material.dart';

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
          );
        }
    );
  }
}