import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class PlayerBackground extends StatelessWidget {
  const PlayerBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://cdn.vox-cdn.com/thumbor/kLhMHqhPRHYV2SPs-qOgIw_uO6I=/0x0:1920x1080/1200x800/filters:focal(807x387:1113x693)/cdn.vox-cdn.com/uploads/chorus_image/image/63304028/surprise_marvel_releases_a_new_full_trailer_and_poster_for_avengers_endgame_social.0.jpg",
      fit: BoxFit.cover,
      width: mqWidth(context, 100),
      height: mqHeigth(context, 100),
    );
  }
}