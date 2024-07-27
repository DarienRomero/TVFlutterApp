import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/providers/player_provider.dart';
import 'package:tv_flutter_app/utils/labels.dart';
import 'package:tv_flutter_app/widgets/common/focusable_icon.dart';
import 'package:tv_flutter_app/widgets/common/h_spacing.dart';

class PlayerBottomControls extends StatelessWidget {
  final bool isPlaying;
  final Function() onBack;
  final Function() onForward;
  final Function() onPlay;
  const PlayerBottomControls({
    super.key,
    required this.isPlaying,
    required this.onBack,
    required this.onForward,
    required this.onPlay
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FocusableIcon(
          path: "assets/icons/double-left.svg",
          label: playerBackwardOption,
          leftLabel: playerBackOption,
          topLabel: playerBackOption,
          rightLabel: playerPlayOption,
          onEnterPressed: onBack,
          onLeftPressed: (){
            Provider.of<PlayerProvider>(context, listen: false).activeControls();
          },
          onRightPressed: (){
            Provider.of<PlayerProvider>(context, listen: false).activeControls();
          },
        ),
        const HSpacing(2),
        FocusableIcon(
          path: isPlaying ? "assets/icons/pause-icon.svg" : "assets/icons/play-icon.svg",
          size: 5,
          label: playerPlayOption,
          leftLabel: playerBackwardOption,
          topLabel: playerBackOption,
          rightLabel: playerForwardOption,
          onEnterPressed: onPlay,
          onLeftPressed: (){
            Provider.of<PlayerProvider>(context, listen: false).activeControls();
          },
          onRightPressed: (){
            Provider.of<PlayerProvider>(context, listen: false).activeControls();
          },
        ),
        const HSpacing(2),
        FocusableIcon(
          path: "assets/icons/double-right.svg",
          label: playerForwardOption,
          leftLabel: playerPlayOption,
          topLabel: playerBackOption,
          onEnterPressed: onForward,
          onLeftPressed: (){
            Provider.of<PlayerProvider>(context, listen: false).activeControls();
          },
          onRightPressed: (){
            Provider.of<PlayerProvider>(context, listen: false).activeControls();
          },
        ),
      ],
    );
  }
}