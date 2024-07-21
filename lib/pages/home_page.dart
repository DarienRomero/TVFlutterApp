import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/providers/button_focus_provider.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/common/sidebar.dart';
import 'package:tv_flutter_app/widgets/common/v_spacing.dart';
import 'package:tv_flutter_app/widgets/home/home_gradient.dart';
import 'package:tv_flutter_app/widgets/home/home_middle_controls.dart';
import 'package:tv_flutter_app/widgets/home/movies_list.dart';
import 'package:tv_flutter_app/widgets/home/home_top_controls.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<ButtonFocusProvider>(context, listen: false).buttonFocusedLabel = "home_play_icon";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Stack(
            children: [
              Image.network(
                "https://cdn.vox-cdn.com/thumbor/kLhMHqhPRHYV2SPs-qOgIw_uO6I=/0x0:1920x1080/1200x800/filters:focal(807x387:1113x693)/cdn.vox-cdn.com/uploads/chorus_image/image/63304028/surprise_marvel_releases_a_new_full_trailer_and_poster_for_avengers_endgame_social.0.jpg",
                fit: BoxFit.cover,
                width: mqWidth(context, 90),
                height: mqHeigth(context, 100),
              ),
              const HomeGradient(),
              Container(
                width: mqWidth(context, 90),
                height: mqHeigth(context, 100),
                padding: EdgeInsets.symmetric(
                  horizontal: mqWidth(context, 2),
                  vertical: mqHeigth(context, 4)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const HomeTopControls(),
                    Expanded(child: Container()),
                    const HomeMiddleControls(),
                    const VSpacing(15),
                    const MoviesList()
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}