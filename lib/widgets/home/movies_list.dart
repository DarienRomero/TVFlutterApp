import 'package:flutter/material.dart';
import 'package:tv_flutter_app/models/movie_model.dart';
import 'package:tv_flutter_app/utils/labels.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/home/movie_item_list.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mqHeigth(context, 42),
      child: ListView.builder(
        itemCount: MovieModel.exampleList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = MovieModel.exampleList[index];
          final label = "$topMoviesItem$index";
          return MovieListItem(
            movieModel: item, 
            label: label,
            leftLabel: index == 0 ? sidebarProfileOption : "$topMoviesItem${index - 1}",
            rightLabel: index >= MovieModel.exampleList.length - 1 ? null  : "$topMoviesItem${index + 1}",
            topLabel: homePlayIcon,
          );
        },
      ),
    );
  }
}