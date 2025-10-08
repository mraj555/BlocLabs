// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Movie _$MovieFromJson(Map<String, dynamic> json) => _Movie(
  total: json['total'] as String? ?? '',
  page: (json['page'] as num?)?.toInt() ?? 0,
  pages: (json['pages'] as num?)?.toInt() ?? 0,
  tv_shows: (json['tv_shows'] as List<dynamic>?)?.map((e) => Shows.fromJson(e as Map<String, dynamic>)).toList() ?? const [],
);

Map<String, dynamic> _$MovieToJson(_Movie instance) => <String, dynamic>{
  'total': instance.total,
  'page': instance.page,
  'pages': instance.pages,
  'tv_shows': instance.tv_shows,
};
