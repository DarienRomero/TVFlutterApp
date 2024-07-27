import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/models/movie_model.dart';
import 'package:tv_flutter_app/providers/button_focus_provider.dart';
import 'package:tv_flutter_app/providers/player_provider.dart';
import 'package:tv_flutter_app/utils/labels.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/common/focusable_icon.dart';
import 'package:tv_flutter_app/widgets/common/h_spacing.dart';
import 'package:tv_flutter_app/widgets/common/v_spacing.dart';
import 'package:tv_flutter_app/widgets/player/custom_video_player.dart';
import 'package:tv_flutter_app/widgets/player/player_bottom_controls.dart';
import 'package:tv_flutter_app/widgets/player/player_gradient.dart';

class PlayerPage extends StatefulWidget {
  final MovieModel movieModel;
  const PlayerPage({
    super.key,
    required this.movieModel
  });

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlayerProvider(),
      child: Builder(
        builder: (context) {
          return WillPopScope(
            onWillPop: () {
              final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
              buttonFocusProvider.buttonFocusedLabel = buttonFocusProvider.lastButtonFocusedLabel;
              Provider.of<PlayerProvider>(context, listen: false).disposeVideoPlayer().then((_){
                Navigator.pop(context);
              });
              return Future.value(false);
            },
            child: Scaffold(
              body: Stack(
                children: [
                  CustomVideoPlayer(
                    movieModel: widget.movieModel,
                  ),
                  Builder(
                    builder: (context) {
                      final playerProvider = Provider.of<PlayerProvider>(context);
                      if(playerProvider.videoPlayerDisposed) return Container();
                      return AnimatedOpacity(
                        opacity: playerProvider.controlsVisible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: Stack(
                          children: [
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
                                  Row(
                                    children: [
                                      const HSpacing(2),
                                      FocusableIcon(
                                        path: "assets/icons/arrow-back-icon.svg",
                                        outlined: true,
                                        label: playerBackOption,
                                        bottomLabel: playerPlayOption,
                                        rightLabel: playerBackwardOption,
                                        onEnterPressed: () {
                                          final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
                                          buttonFocusProvider.buttonFocusedLabel = buttonFocusProvider.lastButtonFocusedLabel;
                                          Provider.of<PlayerProvider>(context, listen: false).disposeVideoPlayer().then((_){
                                            Navigator.pop(context);
                                          });
                                          return Future.value(false);
                                        },
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
                                      PlayerBottomControls(
                                        isPlaying: playerProvider.videoPlayerInitialized ? playerProvider.videoPlayerController.value.isPlaying : false,
                                        onBack: playerProvider.goBack,
                                        onForward: playerProvider.goForward,
                                        onPlay: (){
                                          playerProvider.onPlay();
                                        }
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
          );
        }
      )
    );
  }
  void onBack(){
    final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
    buttonFocusProvider.buttonFocusedLabel = buttonFocusProvider.lastButtonFocusedLabel;
    Provider.of<PlayerProvider>(context, listen: false).disposeVideoPlayer().then((_){
      Navigator.pop(context);
    });
  }
}