part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final APIResponse<Movie> movies;

  const MovieState({required this.movies});

  MovieState copyWith({APIResponse<Movie>? movies}) => MovieState(movies: movies ?? this.movies);

  @override
  List<Object?> get props => [movies];
}
