import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/models/movie_model.dart';
import 'package:tv_flutter_app/pages/player_page.dart';
import 'package:tv_flutter_app/providers/button_focus_provider.dart';
import 'package:tv_flutter_app/providers/focused_movie_provider.dart';
import 'package:tv_flutter_app/utils/labels.dart';
import 'package:tv_flutter_app/utils/navigation.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/common/button_detector_wrapper.dart';

class MovieListItem extends StatelessWidget {
  final MovieModel movieModel;
  final String label;
  final String? topLabel;
  final String? bottomLabel;
  final Function? onPressed;
  final int index;
  final List<MovieModel> topMovies;

  const MovieListItem({
    super.key,
    required this.movieModel,
    required this.label,
    this.topLabel,
    this.bottomLabel,
    this.onPressed,
    required this.index,
    required this.topMovies
  });

  @override
  Widget build(BuildContext context) {
    final leftLabel = index == 0 ? sidebarProfileOption : "$topMoviesItem${index - 1}";
    final rightLabel = index >= topMovies.length - 1 ? null  : "$topMoviesItem${index + 1}";
    return Selector<ButtonFocusProvider, String>(
      selector: (context, buttonFocusProvider) => buttonFocusProvider.buttonFocusedLabel,
      builder: (context, buttonFocusedLabel, _) {
        final focused = buttonFocusedLabel.contains(label);
        return ButtonDetectorWrapper(
          hasFocus: focused,
          onLeftPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            final focusedMovieProvider = Provider.of<FocusedMovieProvider>(context, listen: false);
            buttonFocusProvider.buttonFocusedLabel = leftLabel;
            if(index > 0){
              focusedMovieProvider.focusedMovie = topMovies[index - 1];
            }
          },
          onRightPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            final focusedMovieProvider = Provider.of<FocusedMovieProvider>(context, listen: false);
            if(rightLabel != null){
              if(index < topMovies.length - 1 ){
                focusedMovieProvider.focusedMovie = topMovies[index + 1];
              }
              buttonFocusProvider.buttonFocusedLabel = rightLabel;
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
            buttonFocusProvider.lastButtonFocusedLabel = label;
            Navigator.push(context, materialNavigationRoute(context, PlayerPage(
              movieModel: movieModel,
            )));
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
                Navigator.push(context, materialNavigationRoute(context, PlayerPage(
                  movieModel: movieModel,
                )));
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
                    image: NetworkImage(
                      movieModel.verticalPhoto,
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