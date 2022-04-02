import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapptask/data/model/movie_details_model.dart';
import 'package:movieapptask/data/model/movies_page_model.dart';
import 'package:movieapptask/data/repository/movies_repository.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {

  final MoviesRepository moviesRepository;
  List<Movie> movies = [];
  MovieDetails movieDetails = new MovieDetails();
  MoviesCubit(this.moviesRepository) : super(MoviesInitial());

  List<Movie> getAllMovies(){
    moviesRepository.getAllMovies().then((movies){
      emit(MoviesLoaded(movies));
      this.movies = movies;
    });
    return movies;
  }

  MovieDetails getMovieDetails(int movieId){
    moviesRepository.getMovieDetails(movieId).then((movieDetails){
      emit(MovieDetailsLoaded(movieDetails));
      this.movieDetails = movieDetails;
    });
    return movieDetails;
  }
}
