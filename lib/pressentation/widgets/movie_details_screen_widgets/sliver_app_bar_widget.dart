import 'package:flutter/material.dart';
import 'package:movieapptask/config/app_colors.dart';
import 'package:movieapptask/config/strings.dart';

class SilverAppBarMovie extends StatelessWidget {
  final String movieName;
  final int movieId;
  final String posterPath;

  SilverAppBarMovie(this.movieName, this.posterPath, this.movieId);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      //stretch: false,
      backgroundColor: AppColors.myRed,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          movieName,
          style: TextStyle(color: AppColors.myWhite),
        ),
        background: Hero(
          tag: movieId,
          child: Image.network(
            imageURL+posterPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
