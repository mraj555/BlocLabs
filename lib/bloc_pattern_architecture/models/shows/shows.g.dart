// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Shows _$ShowsFromJson(Map<String, dynamic> json) => _Shows(
  name: json['name'] as String? ?? '',
  permalink: json['permalink'] as String? ?? '',
  end_date: json['end_date'] as String? ?? '',
  network: json['network'] as String? ?? '',
  image_thumbnail_path: json['image_thumbnail_path'] as String? ?? '',
  status: json['status'] as String? ?? '',
);

Map<String, dynamic> _$ShowsToJson(_Shows instance) => <String, dynamic>{
  'name': instance.name,
  'permalink': instance.permalink,
  'end_date': instance.end_date,
  'network': instance.network,
  'image_thumbnail_path': instance.image_thumbnail_path,
  'status': instance.status,
};
