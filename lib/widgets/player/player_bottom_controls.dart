import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/providers/player_provider.dart';
import 'package:tv_flutter_app/utils/labels.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/common/focusable_icon.dart';
import 'package:tv_flutter_app/widgets/common/h_spacing.dart';
import 'package:tv_flutter_app/widgets/common/v_spacing.dart';
import 'package:video_player/video_player.dart';

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
    final playerProvider = Provider.of<PlayerProvider>(context);
    return playerProvider.videoPlayerInitialized ? Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(playerProvider.nowTime, style: const TextStyle(color: Colors.white)),
            Container(
              width: mqWidth(context, 75),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: VideoProgressIndicator(
                playerProvider.videoPlayerController,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  playedColor: Colors.red,
                  bufferedColor: Colors.white,
                  backgroundColor: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
            Text(playerProvider.totalTime, style: const TextStyle(color: Colors.white)),
          ],
        ),
        const VSpacing(2),
        Row(
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
        ),
      ],
    ) : Container();
  }
}