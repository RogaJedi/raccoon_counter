
import 'package:flutter/material.dart';

import '../../player.dart';

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
            color: Color(0xFF353535),
          );
        }
    );
  }
}