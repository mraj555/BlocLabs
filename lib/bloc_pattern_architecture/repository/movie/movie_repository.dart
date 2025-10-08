import 'package:bloclabs/bloc_pattern_architecture/models/movie/movie.dart';

abstract class MovieRepository {
  Future<Movie> fetchMovies();
}
