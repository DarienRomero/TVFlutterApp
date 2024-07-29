

import 'dart:io';

import 'package:tv_flutter_app/models/error_model.dart';
import 'package:tv_flutter_app/models/movie_model.dart';

@override
class MoviesController {

  MoviesController._privateConstructor();
  static final MoviesController _instance = MoviesController._privateConstructor();
  factory MoviesController() => _instance;

  Future<dynamic> readTopMovies() async {
    try{
      //TODO: Change to http implementation
      await Future.delayed(const Duration(seconds: 1));
      return MovieModel.exampleList;
    } on SocketException {
      return ErrorResponse.network;
    } catch(e){
      return ErrorResponse.unknown;
    }
  }
} 