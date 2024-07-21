import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/common/focusable_icon.dart';
import 'package:tv_flutter_app/widgets/common/h_spacing.dart';
import 'package:tv_flutter_app/widgets/common/v_spacing.dart';
import 'package:tv_flutter_app/widgets/player/player_background.dart';
import 'package:tv_flutter_app/widgets/player/player_bottom_controls.dart';
import 'package:tv_flutter_app/widgets/player/player_gradient.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PlayerBackground(),
          const PlayerGradient(),
          Container(
            width: mqWidth(context, 100),
            height: mqHeigth(context, 100),
            padding: EdgeInsets.symmetric(
              vertical: mqHeigth(context, 2)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    HSpacing(2),
                    FocusableIcon(
                      focused: false, 
                      path: "assets/icons/arrow-back-icon.svg",
                      outlined: true,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 5,
                      width: mqWidth(context, 90),
                      color: Colors.white,
                    ),
                    const VSpacing(2),
                    const PlayerBottomControls()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}