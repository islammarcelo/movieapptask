import 'package:movieapptask/data/model/movie_details_model.dart';
import 'package:movieapptask/data/model/movies_page_model.dart';
import 'package:movieapptask/data/web_services/movie_web_services.dart';

class MoviesRepository {
  final MoviesWebServices moviesWebServices;

  MoviesRepository(this.moviesWebServices);

  Future<List<Movie>> getAllMovies() async {
    final data = await moviesWebServices.getAllMovies();
    MoviesPage moviesPage = MoviesPage.fromJson(data);
    return moviesPage.movies;
  }

  Future<MovieDetails> getMovieDetails(int movieId) async {
    final data = await moviesWebServices.getMovieDetails(movieId);
    MovieDetails movieDetailsModel = MovieDetails.fromJson(data);
    return movieDetailsModel;
  }

}