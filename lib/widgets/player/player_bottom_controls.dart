import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/labels.dart';
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
          path: "assets/icons/double-left.svg",
          label: playerBackwardOption,
          leftLabel: playerBackOption,
          topLabel: playerBackOption,
          rightLabel: playerPlayOption,
        ),
        HSpacing(2),
        FocusableIcon(
          path: "assets/icons/play-icon.svg",
          size: 5,
          label: playerPlayOption,
          leftLabel: playerBackwardOption,
          topLabel: playerBackOption,
          rightLabel: playerForwardOption,
        ),
        HSpacing(2),
        FocusableIcon(
          path: "assets/icons/double-right.svg",
          label: playerForwardOption,
          leftLabel: playerPlayOption,
          topLabel: playerBackOption,
        ),
      ],
    );
  }
}