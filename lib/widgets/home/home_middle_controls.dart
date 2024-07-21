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
          focused: false, 
          path: "assets/icons/arrow-back-icon.svg",
          outlined: true,
        ),
        FocusableIcon(
          focused: false, 
          path: "assets/icons/play-icon.svg",
          size: 8,
          backgroundOpacity: 0.6,
        ),
        FocusableIcon(
          focused: false, 
          path: "assets/icons/arrow-forward-icon.svg",
          outlined: true,
        ),
      ],
    );
  }
}