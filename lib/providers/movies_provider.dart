import 'package:flutter/material.dart';
import 'package:tv_flutter_app/controllers/movies_controller.dart';
import 'package:tv_flutter_app/models/error_model.dart';
import 'package:tv_flutter_app/models/movie_model.dart';

class MoviesProvider extends ChangeNotifier {
  bool loadingTopMovies = false;
  bool errorTopMovies = false;
  List<MovieModel> topMovies = [];

  final moviesController = MoviesController();

  Future<List<MovieModel>> readTopMovies() async {
    loadingTopMovies = true;
    errorTopMovies = false;
    notifyListeners();
    final resp = await moviesController.readTopMovies();
    if(resp is ErrorResponse){
      loadingTopMovies = false;
      errorTopMovies = true;
      notifyListeners();
    }
    loadingTopMovies = false;
    errorTopMovies = false;
    topMovies = resp;
    notifyListeners();
    return topMovies;
  }

}