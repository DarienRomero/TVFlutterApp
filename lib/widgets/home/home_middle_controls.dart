import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/labels.dart';
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
          label: homePreviousMovie,
          rightLabel: homePlayIcon,
          leftLabel: sidebarProfileOption,
        ),
        FocusableIcon(
          path: "assets/icons/play-icon.svg",
          size: 8,
          backgroundOpacity: 0.6,
          label: homePlayIcon,
          leftLabel: homePreviousMovie,
          rightLabel: homeNextMovie,
        ),
        FocusableIcon(
          path: "assets/icons/arrow-forward-icon.svg",
          outlined: true,
          label: homeNextMovie,
          leftLabel: homePlayIcon,
        ),
      ],
    );
  }
}