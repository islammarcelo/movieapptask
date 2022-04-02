import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapptask/business_logic/movies_cubit.dart';
import 'package:movieapptask/config/strings.dart';
import 'package:movieapptask/data/model/movie_details_model.dart';
import 'package:movieapptask/data/repository/movies_repository.dart';
import 'package:movieapptask/data/web_services/movie_web_services.dart';
import 'package:movieapptask/pressentation/screens/movie_details_screen.dart';
import 'package:movieapptask/pressentation/screens/movies_screen.dart';
import 'package:movieapptask/pressentation/screens/splash_screen.dart';

class AppRouter {
  late MoviesRepository moviesRepository;
  late MoviesCubit moviesCubit;

  AppRouter(){
    moviesRepository = MoviesRepository(MoviesWebServices());
    moviesCubit = MoviesCubit(moviesRepository);
  }

  Route? generateRoute(RouteSettings settings) {
      switch(settings.name){
        case splashScreen:
          return MaterialPageRoute(
              builder: (context) => SplashScreen());

        case moviesScreen:
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                  create: (BuildContext context) => moviesCubit,
                  child: MoviesScreen()));

        case movieDetailsScreen:
          final movieId = settings.arguments as int;
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                  create: (BuildContext context) => MoviesCubit(moviesRepository),
                  child: MovieDetailsScreen(movieId)));
      }
  }
}