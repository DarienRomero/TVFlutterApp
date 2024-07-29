import 'package:flutter/material.dart';
import 'package:tv_flutter_app/models/movie_model.dart';

class FocusedMovieProvider extends ChangeNotifier{
  MovieModel _focusedMovie = MovieModel.empty;

  set focusedMovie(MovieModel focusedMovie){
    _focusedMovie = focusedMovie;
    notifyListeners();
  }
  MovieModel get focusedMovie => _focusedMovie;
}