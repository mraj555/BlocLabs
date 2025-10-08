import 'package:bloclabs/bloc_pattern_architecture/models/shows/shows.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

part 'movie.g.dart';

@freezed
abstract class Movie with _$Movie {
  factory Movie({@Default('') String total, @Default(0) int page, @Default(0) int pages, @Default([]) List<Shows> tv_shows}) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
