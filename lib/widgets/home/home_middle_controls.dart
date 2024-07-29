import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/providers/focused_movie_provider.dart';
import 'package:tv_flutter_app/providers/movies_provider.dart';
import 'package:tv_flutter_app/utils/labels.dart';
import 'package:tv_flutter_app/widgets/common/focusable_icon.dart';

class HomeMiddleControls extends StatelessWidget {
  const HomeMiddleControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FocusableIcon(
          path: "assets/icons/arrow-back-icon.svg",
          outlined: true,
          label: homePreviousMovie,
          rightLabel: homePlayIcon,
          leftLabel: sidebarProfileOption,
          bottomLabel: '${topMoviesItem}0',
          onBottomPressed: (){
            selectFocusedMovie(context);
          },
        ),
        FocusableIcon(
          path: "assets/icons/play-icon.svg",
          size: 8,
          backgroundOpacity: 0.6,
          label: homePlayIcon,
          leftLabel: homePreviousMovie,
          rightLabel: homeNextMovie,
          bottomLabel: '${topMoviesItem}0',
          onBottomPressed: (){
            selectFocusedMovie(context);
          },
        ),
        FocusableIcon(
          path: "assets/icons/arrow-forward-icon.svg",
          outlined: true,
          label: homeNextMovie,
          leftLabel: homePlayIcon,
          bottomLabel: '${topMoviesItem}0',
          onBottomPressed: (){
            selectFocusedMovie(context);
          },
        ),
      ],
    );
  }
  void selectFocusedMovie(BuildContext context){
    final topMovies = Provider.of<MoviesProvider>(context, listen: false).topMovies;
    final focusedMovieProvider = Provider.of<FocusedMovieProvider>(context, listen: false);
    if(topMovies.isNotEmpty){
      focusedMovieProvider.focusedMovie = topMovies.first;
    }
  }
}