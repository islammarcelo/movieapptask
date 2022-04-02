import 'package:flutter/material.dart';
import 'package:movieapptask/config/app_colors.dart';
import 'package:movieapptask/config/size_config.dart';
import 'package:movieapptask/config/strings.dart';
import 'package:movieapptask/data/model/movies_page_model.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColors.myBlack,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, movieDetailsScreen , arguments: movie.id),
        child: GridTile(
          child: Hero(
            tag: movie.id,
            child: Container(
              color: AppColors.myBlack,
              child: movie.posterPath.isNotEmpty
                  ? FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/loading.gif',
                image: '$imageURL'+movie.posterPath,
                fit: BoxFit.cover,
              )
                  : Image.asset('assets/images/movie-temp.gif'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${movie.title}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: AppColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}