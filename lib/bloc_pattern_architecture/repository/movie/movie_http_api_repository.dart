import 'package:bloclabs/bloc_pattern_architecture/config/app_urls.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/data/network/network_services_api.dart';
import 'package:bloclabs/bloc_pattern_architecture/models/movie/movie.dart';
import 'package:bloclabs/bloc_pattern_architecture/repository/movie/movie_repository.dart';

class MovieHttpAPIRepository implements MovieRepository {
  final _api = NetworkServicesAPI();

  @override
  Future<Movie> fetchMovies() async {
    final response = await _api.onGetAPI(AppURLs.popular_movies);
    return Movie.fromJson(response);
  }
}