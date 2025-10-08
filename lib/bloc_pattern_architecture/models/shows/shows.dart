import 'package:freezed_annotation/freezed_annotation.dart';

part 'shows.freezed.dart';

part 'shows.g.dart';

@freezed
abstract class Shows with _$Shows {
  factory Shows({
    @Default('') String name,
    @Default('') String permalink,
    @Default('') String end_date,
    @Default('') String network,
    @Default('') String image_thumbnail_path,
    @Default('') String status,
  }) = _Shows;

  factory Shows.fromJson(Map<String, dynamic> json) => _$ShowsFromJson(json);
}
