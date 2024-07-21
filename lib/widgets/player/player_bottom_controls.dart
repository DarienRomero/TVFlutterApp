import 'package:flutter/material.dart';
import 'package:tv_flutter_app/widgets/common/focusable_icon.dart';
import 'package:tv_flutter_app/widgets/common/h_spacing.dart';

class PlayerBottomControls extends StatelessWidget {
  const PlayerBottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FocusableIcon(
          focused: false, 
          path: "assets/icons/double-left.svg",
        ),
        HSpacing(2),
        FocusableIcon(
          focused: false, 
          path: "assets/icons/play-icon.svg",
          size: 5,
        ),
        HSpacing(2),
        FocusableIcon(
          focused: false, 
          path: "assets/icons/double-right.svg",
        ),
      ],
    );
  }
}