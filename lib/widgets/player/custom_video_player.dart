import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/models/movie_model.dart';
import 'package:tv_flutter_app/providers/player_provider.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final MovieModel movieModel;
  const CustomVideoPlayer({
    super.key,
    required this.movieModel
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<PlayerProvider>(context, listen: false).init(widget.movieModel.url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<PlayerProvider, bool>(
      selector: (context, playerProvider) => playerProvider.videoPlayerInitialized,
      builder: (context, videoPlayerInitialized, _) {
        return videoPlayerInitialized ? Selector<PlayerProvider, VideoPlayerController>(
          selector: (context, playerProvider) => playerProvider.videoPlayerController,
          builder: (context, videoPlayerController, _) {
            return Center(
              child: videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(videoPlayerController),
                  )
                : Container(),
            );
          }
        ) : Container();
      });
  }
}