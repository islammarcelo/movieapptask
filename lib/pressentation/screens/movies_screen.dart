import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapptask/business_logic/movies_cubit.dart';
import 'package:movieapptask/config/app_colors.dart';
import 'package:movieapptask/data/model/movies_page_model.dart';
import 'package:movieapptask/pressentation/widgets/movies_screen_widgets/movie_item.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late List<Movie> movies;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesCubit>(context).getAllMovies();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.myBlack,
      appBar: AppBar(
        backgroundColor: AppColors.myRed,
        title: Text(
          'Movie App Task',
          style: TextStyle(color: AppColors.myWhite),
        ) ,
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          movies = (state).movies;

          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.myRed,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.myBlack,
        child: Column(
          children: [
            buildMoviesList(),
          ],
        ),
      ),
    );
  }

  Widget buildMoviesList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount:movies.length,
        itemBuilder: (ctx, index) {
          return MovieItem(movies[index]);
        });
  }

}
