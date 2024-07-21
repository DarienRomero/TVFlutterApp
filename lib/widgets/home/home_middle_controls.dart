import 'package:flutter/material.dart';
import 'package:tv_flutter_app/widgets/common/focusable_icon.dart';

class HomeMiddleControls extends StatelessWidget {
  const HomeMiddleControls({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FocusableIcon(
          path: "assets/icons/arrow-back-icon.svg",
          outlined: true,
          label: "home_previous_movie",
          rightLabel: "home_play_icon",
        ),
        FocusableIcon(
          path: "assets/icons/play-icon.svg",
          size: 8,
          backgroundOpacity: 0.6,
          label: "home_play_icon",
          leftLabel: "home_previous_movie",
          rightLabel: "home_next_movie",
        ),
        FocusableIcon(
          path: "assets/icons/arrow-forward-icon.svg",
          outlined: true,
          label: "home_next_movie",
          leftLabel: "home_play_icon"
        ),
      ],
    );
  }
}