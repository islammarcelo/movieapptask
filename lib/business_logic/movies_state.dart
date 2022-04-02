part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;

  MoviesLoaded(this.movies);
}
class MovieDetailsLoaded extends MoviesState {
  final MovieDetails movieDetails;

  MovieDetailsLoaded(this.movieDetails);
}
