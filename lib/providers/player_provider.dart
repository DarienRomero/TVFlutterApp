import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/constants.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:video_player/video_player.dart';

class PlayerProvider extends ChangeNotifier{
  bool videoPlayerInitialized = false;
  bool videoPlayerDisposed = false;
  late VideoPlayerController videoPlayerController;
  String nowTime = "00:00";
  String totalTime = "00:00";
  late Timer timer;
  bool controlsVisible = true;
  late Timer timerTrackVideo;
  final oneSec = const Duration(seconds: 1);
  bool isPlaying = false;

  init(String url){
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        url))
      ..initialize().then((_) {
        videoPlayerInitialized = true;
        totalTime = parseTotalTime(videoPlayerController.value.duration.inMilliseconds.round());
        videoPlayerController.play();
        isPlaying = true;
        notifyListeners();
      });
    timer = Timer(const Duration(seconds: 3), () {
      controlsVisible = false;
      notifyListeners();
    });
    timerTrackVideo = Timer.periodic(oneSec, (Timer t){
      checkTimer();
    });
  }

  void checkTimer() {
    if(videoPlayerDisposed) return;
    Duration duration = Duration(milliseconds: videoPlayerController.value.position.inMilliseconds);
    nowTime = parseTotalTime(duration.inMilliseconds);
    notifyListeners();
  }

  void onPlay() {
    activeControls();
    if(isPlaying){
      videoPlayerController.pause().then((_){
        isPlaying = false;
        checkTimer();
      });
    }else{
      videoPlayerController.play().then((_){
        isPlaying = true;
        checkTimer();
      });
    }
  }

  Future<void> goForward() async {
    try{
      activeControls();
      int now = videoPlayerController.value.position.inMilliseconds.round();
      int max = videoPlayerController.value.duration.inMilliseconds.round();
      int after = now + timerBackorForwardMilliseconds;
      if(after < max){
        Duration afterDuration = Duration(milliseconds: after);
        await videoPlayerController.seekTo(afterDuration);
        checkTimer();
      }
    }catch(_){}
  }

  Future<void> goBack() async {
    try{
      activeControls();
      int now = videoPlayerController.value.position.inMilliseconds.round();
      int before = now - timerBackorForwardMilliseconds;
      if(before < 0){
        before = 0;
      }
      Duration beforeDuration = Duration(milliseconds: before);
      await videoPlayerController.seekTo(beforeDuration);
      checkTimer();
    }catch(_){}
  }

  Future<void> disposeVideoPlayer() async {
    timerTrackVideo.cancel();
    timer.cancel();
    videoPlayerDisposed = true;
    await videoPlayerController.dispose();
  }

  void activeControls(){
    timer.cancel();
    controlsVisible = true;
    notifyListeners();
    timer = Timer(const Duration(seconds: 3), () {
      if(videoPlayerDisposed) return;
      controlsVisible = false;
      notifyListeners();
    });
  }
}