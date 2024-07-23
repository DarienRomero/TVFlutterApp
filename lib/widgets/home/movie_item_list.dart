import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/models/movie_model.dart';
import 'package:tv_flutter_app/pages/player_page.dart';
import 'package:tv_flutter_app/providers/button_focus_provider.dart';
import 'package:tv_flutter_app/utils/labels.dart';
import 'package:tv_flutter_app/utils/navigation.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/common/button_detector_wrapper.dart';

class MovieListItem extends StatelessWidget {
  final MovieModel movieModel;
  final String label;
  final String? leftLabel;
  final String? rightLabel;
  final String? topLabel;
  final String? bottomLabel;
  final Function? onPressed;

  const MovieListItem({
    super.key,
    required this.movieModel,
    required this.label,
    this.leftLabel,
    this.rightLabel,
    this.topLabel,
    this.bottomLabel,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Selector<ButtonFocusProvider, String>(
      selector: (context, buttonFocusProvider) => buttonFocusProvider.buttonFocusedLabel,
      builder: (context, buttonFocusedLabel, _) {
        final focused = buttonFocusedLabel.contains(label);
        return ButtonDetectorWrapper(
          hasFocus: focused,
          onLeftPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            if(leftLabel != null){
              buttonFocusProvider.buttonFocusedLabel = leftLabel!;
            }else{
              buttonFocusProvider.buttonFocusedLabel = "${label}_${buttonFocusProvider.getRandomNumber()}";
            }
          },
          onRightPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            if(rightLabel != null){
              buttonFocusProvider.buttonFocusedLabel = rightLabel!;
            }else{
              buttonFocusProvider.buttonFocusedLabel = "${label}_${buttonFocusProvider.getRandomNumber()}";
            }
          },
          onTopPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            if(topLabel != null){
              buttonFocusProvider.buttonFocusedLabel = topLabel!;
            }else{
              buttonFocusProvider.buttonFocusedLabel = "${label}_${buttonFocusProvider.getRandomNumber()}";
            }
          },
          onBottomPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            if(bottomLabel != null){
              buttonFocusProvider.buttonFocusedLabel = bottomLabel!;
            }else{
              buttonFocusProvider.buttonFocusedLabel = "${label}_${buttonFocusProvider.getRandomNumber()}";
            }
          },
          onEnterPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            buttonFocusProvider.buttonFocusedLabel = playerPlayOption;
            Navigator.push(context, materialNavigationRoute(context, const PlayerPage()));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.only(
              right: mqWidth(context, 2),
              top: mqHeigth(context, focused ? 0 : 1),
              bottom: mqHeigth(context, focused ? 0 : 1)
            ),
            child: InkWell(
              onTap: (){
                Navigator.push(context, materialNavigationRoute(context, const PlayerPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: focused ? Border.all(
                    color: Colors.white,
                    width: 2.0
                  ) : null
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage(
                    width: mqWidth(context, focused ? 16 : 15),
                    height: mqHeigth(context, 40),
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 100),
                    placeholder: const AssetImage("assets/images/loading_image.gif"), 
                    image: const NetworkImage(
                      "https://m.media-amazon.com/images/I/81ai6zx6eXL._AC_SL1304_.jpg",
                    )
                  ),
                ),
              ),
            )
          ),
        );
      }
    );
  }
}