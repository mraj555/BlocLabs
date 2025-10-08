import 'package:bloc/bloc.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/data/response/api_response.dart';
import 'package:bloclabs/bloc_pattern_architecture/models/movie/movie.dart';
import 'package:bloclabs/bloc_pattern_architecture/repository/movie/movie_repository.dart';
import 'package:equatable/equatable.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieRepository repo;

  MovieBloc({required this.repo}) : super(MovieState(movies: APIResponse.loading())) {
    on<MovieFetched>(_onMovieFetched);
  }

  void _onMovieFetched(MovieFetched event, Emitter<MovieState> emit) async {
    await repo
        .fetchMovies()
        .then((value) {
          emit(state.copyWith(movies: APIResponse.completed(value)));
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(movies: APIResponse.error(error.toString())));
        });
  }
}
