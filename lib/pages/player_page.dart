import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/custom_icon_button.dart';
import 'package:tv_flutter_app/widgets/focusable_icon.dart';
import 'package:tv_flutter_app/widgets/h_spacing.dart';
import 'package:tv_flutter_app/widgets/v_spacing.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://cdn.vox-cdn.com/thumbor/kLhMHqhPRHYV2SPs-qOgIw_uO6I=/0x0:1920x1080/1200x800/filters:focal(807x387:1113x693)/cdn.vox-cdn.com/uploads/chorus_image/image/63304028/surprise_marvel_releases_a_new_full_trailer_and_poster_for_avengers_endgame_social.0.jpg",
            fit: BoxFit.cover,
            width: mqWidth(context, 90),
            height: mqHeigth(context, 100),
          ),
          Container(
            width: mqWidth(context, 90),
            height: mqHeigth(context, 100),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black38, Color(0x00000000)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
            ),
          ),
          SizedBox(
            width: mqWidth(context, 100),
            height: mqHeigth(context, 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FocusableIcon(
                      focused: false, 
                      icon: Icons.forward_10_rounded
                    ),
                    const HSpacing(2),
                    CustomIconButton(
                      size: 4, 
                      onPressed: (){

                      }, 
                      icon: const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 20,),
                      iconPer: 0.9,
                      borderWidth: 2.0,
                      borderRadius: 100,
                      borderColor: Colors.white,
                      fillColor: Colors.black.withOpacity(0.5)
                    ),
                    const HSpacing(2),
                    const FocusableIcon(
                      focused: false, 
                      icon: Icons.forward_10_rounded
                    )
                  ],
                ),
                const VSpacing(2)
              ],
            ),
          ),
        ],
      ),
    );
  }
}