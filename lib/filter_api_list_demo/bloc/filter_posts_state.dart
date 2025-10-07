// ignore_for_file: non_constant_identifier_names

import 'package:bloclabs/filter_api_list_demo/model/filter_post_model.dart';
import 'package:bloclabs/filter_api_list_demo/utils/enums.dart';
import 'package:equatable/equatable.dart';

class FilterPostsState extends Equatable {
  final FilterPostsStatus status;
  final List<FilterPostModel> posts;
  final List<FilterPostModel> temp_posts;
  final String message;
  final String search_message;

  const FilterPostsState({
    this.status = FilterPostsStatus.loading,
    this.posts = const <FilterPostModel>[],
    this.temp_posts = const <FilterPostModel>[],
    this.message = "",
    this.search_message = "",
  });

  FilterPostsState copyWith({
    FilterPostsStatus? status,
    List<FilterPostModel>? posts,
    List<FilterPostModel>? temp_posts,
    String? message,
    String? search_message,
  }) => FilterPostsState(
    status: status ?? this.status,
    posts: posts ?? this.posts,
    temp_posts: temp_posts ?? this.temp_posts,
    message: message ?? this.message,
    search_message: search_message ?? this.search_message,
  );

  @override
  List<Object?> get props => [status, posts, temp_posts, message, search_message];
}
