import 'package:bloclabs/bloc_pattern_architecture/config/data/network/network_services_api.dart';
import 'package:bloclabs/bloc_pattern_architecture/models/movie/movie.dart';
import 'package:bloclabs/bloc_pattern_architecture/models/shows/shows.dart';
import 'package:bloclabs/bloc_pattern_architecture/repository/movie/movie_repository.dart';

class MovieMockAPIRepository implements MovieRepository {
  final api = NetworkServicesAPI();

  @override
  Future<Movie> fetchMovies() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = {'total': '0', 'page': 0, 'pages': 0, 'tv_shows': <Shows>[]};
    return Movie.fromJson(response);
  }
}
