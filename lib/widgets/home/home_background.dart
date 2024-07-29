import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/models/movie_model.dart';
import 'package:tv_flutter_app/providers/focused_movie_provider.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<FocusedMovieProvider, MovieModel>(
      selector: (context, focusedMovieProvider) => focusedMovieProvider.focusedMovie,
      builder: (context, focusedMovie, _) {
        if(focusedMovie.id == 0){
          return Container();
        }else{
          return Image.network(
            focusedMovie.horizontalPhoto,
            fit: BoxFit.cover,
            width: mqWidth(context, 90),
            height: mqHeigth(context, 100),
          );
        }
      }
    );
  }
}