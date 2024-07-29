import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/providers/focused_movie_provider.dart';
import 'package:tv_flutter_app/providers/movies_provider.dart';
import 'package:tv_flutter_app/utils/labels.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/common/empty_view.dart';
import 'package:tv_flutter_app/widgets/common/error_view.dart';
import 'package:tv_flutter_app/widgets/common/loading_view.dart';
import 'package:tv_flutter_app/widgets/home/movie_item_list.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late MoviesProvider moviesProvider; 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      moviesProvider.readTopMovies().then((movies){
        if(movies.isNotEmpty){
          final focusedMovieProvider = Provider.of<FocusedMovieProvider>(context, listen: false);
          focusedMovieProvider.focusedMovie = movies.first;
        }
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    moviesProvider = Provider.of<MoviesProvider>(context);
    return SizedBox(
      height: mqHeigth(context, 42),
      child: moviesProvider.loadingTopMovies ? const LoadingView(
          heigth: 5,
        ) : moviesProvider.errorTopMovies ? const ErrorView(
          heigth: 5
        ) : moviesProvider.topMovies.isEmpty ? const EmptyView(
          heigth: 5
        ) :  ListView.builder(
        itemCount: moviesProvider.topMovies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = moviesProvider.topMovies[index];
          final label = "$topMoviesItem$index";
          return MovieListItem(
            movieModel: item, 
            label: label,
            topLabel: homePlayIcon,
            index: index,
            topMovies: moviesProvider.topMovies,
          );
        },
      ),
    );
  }
}