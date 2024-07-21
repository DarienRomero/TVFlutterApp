import 'package:flutter/material.dart';
import 'package:tv_flutter_app/pages/player_page.dart';
import 'package:tv_flutter_app/utils/navigation.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/custom_icon_button.dart';
import 'package:tv_flutter_app/widgets/sidebar.dart';
import 'package:tv_flutter_app/widgets/v_spacing.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              Container(
                width: mqWidth(context, 90),
                height: mqHeigth(context, 100),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Color(0x00000000), Colors.black45],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.2, 0.7, 0.95]
                  )
                ),
              ),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text("Movies", style: TextStyle(
                              color: Colors.white
                            ),),
                            Icon(Icons.arrow_drop_down_rounded, color: Colors.white,)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Series", style: TextStyle(
                              color: Colors.white
                            ),),
                            Icon(Icons.arrow_drop_down_rounded, color: Colors.white,)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Cartoons", style: TextStyle(
                              color: Colors.white
                            ),),
                            Icon(Icons.arrow_drop_down_rounded, color: Colors.white,)
                          ],
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          size: 4, 
                          onPressed: (){

                          }, 
                          icon: const Icon(Icons.arrow_back, color: Colors.white,),
                          borderColor: Colors.white,
                          borderWidth: 1.0,
                          borderRadius: 5,
                          fillColor: const Color(0x00000000),
                        ),
                        CustomIconButton(
                          size: 8, 
                          onPressed: (){

                          }, 
                          icon: const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 40,),
                          iconPer: 0.9,
                          borderRadius: 100,
                          fillColor: Colors.black.withOpacity(0.5)
                        ),
                        CustomIconButton(
                          size: 4, 
                          onPressed: (){

                          }, 
                          icon: const Icon(Icons.arrow_forward, color: Colors.white,),
                          borderColor: Colors.white,
                          borderWidth: 1.0,
                          borderRadius: 5,
                          fillColor: const Color(0x00000000),
                        ),
                      ],
                    ),
                    const VSpacing(15),
                    SizedBox(
                      height: mqHeigth(context, 40),
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: mqWidth(context, 2)
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, materialNavigationRoute(context, const PlayerPage()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: FadeInImage(
                                  width: mqWidth(context, 15),
                                  height: mqHeigth(context, 40),
                                  fit: BoxFit.cover,
                                  fadeInDuration: const Duration(milliseconds: 100),
                                  placeholder: const AssetImage("assets/images/loading_image.gif"), 
                                  image: const NetworkImage(
                                    "https://m.media-amazon.com/images/I/81ai6zx6eXL._AC_SL1304_.jpg",
                                  )
                                ),
                              ),
                            )
                          );
                        },
                      ),
                    )
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