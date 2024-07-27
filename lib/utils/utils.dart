import 'package:flutter/material.dart';

double mqHeigth(BuildContext context, double percentage){
  return MediaQuery.of(context).size.height * (percentage/100);
}
double mqWidth(BuildContext context, double percentage){
  return MediaQuery.of(context).size.width * (percentage/100);
}

String parseTotalTime(int durationTime){
    Duration duration = Duration(milliseconds: durationTime);
    String totalTime = '';
    if(duration.inHours == 0){
      totalTime = [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
    }else{
      totalTime = "${duration.inHours}:";
      totalTime += [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
    }
    return totalTime;
  }