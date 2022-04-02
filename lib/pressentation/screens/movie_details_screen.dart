import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapptask/business_logic/movies_cubit.dart';
import 'package:movieapptask/config/app_colors.dart';
import 'package:movieapptask/config/size_config.dart';
import 'package:movieapptask/data/model/movie_details_model.dart';
import 'package:movieapptask/pressentation/widgets/movie_details_screen_widgets/movie_info_widget.dart';
import 'package:movieapptask/pressentation/widgets/movie_details_screen_widgets/sliver_app_bar_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen(this.movieId);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetailsScreen> {
  MovieDetails movieDetails = new MovieDetails();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesCubit>(context).getMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: AppColors.myBlack,
        body: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MovieDetailsLoaded) {
              movieDetails = (state).movieDetails;
              return CustomScrollView(slivers: [
                SilverAppBarMovie(movieDetails.title, movieDetails.posterPath,
                    widget.movieId),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MovieInfo('overview: ', movieDetails.overview),
                          buildDivider(SizeConfig.blockSizeHorizontal*70),
                          MovieInfo('originalLanguage: ',
                              movieDetails.originalLanguage),
                          buildDivider(SizeConfig.blockSizeHorizontal*55),
                          MovieInfo('status: ', movieDetails.status),
                          buildDivider(SizeConfig.blockSizeHorizontal*75),
                          MovieInfo('releaseDate: ', movieDetails.releaseDate),
                          buildDivider(SizeConfig.blockSizeHorizontal*68),
                          MovieInfo('adult: ', movieDetails.adult.toString()),
                          buildDivider(SizeConfig.blockSizeHorizontal*80),
                          MovieInfo('originalTitle: ', movieDetails.originalTitle),
                          buildDivider(SizeConfig.blockSizeHorizontal*65),
                          MovieInfo('voteAverage: ',
                              movieDetails.voteAverage.toString()),
                          buildDivider(SizeConfig.blockSizeHorizontal*65),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 700,
                    )
                  ]),
                )
              ]);
            } else {
              return showLoadingIndicator();
            }
          },
        ));
  }


  Widget buildDivider(double enIndent) {
    return Divider(
      height: 30,
      endIndent: enIndent,
      color: AppColors.myRed,
      thickness: 2,
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.myRed,
      ),
    );
  }
}
