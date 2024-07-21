import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class PlayerGradient extends StatelessWidget {
  const PlayerGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mqWidth(context, 100),
      height: mqHeigth(context, 100),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black38, Color(0x00000000)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )
      ),
    );
  }
}