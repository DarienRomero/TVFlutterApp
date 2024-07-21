import 'package:flutter/material.dart';
import 'package:tv_flutter_app/pages/player_page.dart';
import 'package:tv_flutter_app/utils/navigation.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}