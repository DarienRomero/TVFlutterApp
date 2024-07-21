import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class HomeGradient extends StatelessWidget {
  const HomeGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mqWidth(context, 90),
      height: mqHeigth(context, 100),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Color(0x00000000), Colors.black45],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.2, 0.7, 0.95]
        )
      ),
    );
  }
}