import 'package:bloclabs/get_api_demo/model/post_model.dart';
import 'package:bloclabs/get_api_demo/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostsState extends Equatable {
  final PostsStatus status;
  final List<PostModel> posts;
  final String message;

  const PostsState({this.status = PostsStatus.loading, this.posts = const <PostModel>[], this.message = ""});

  PostsState copyWith({PostsStatus? status, List<PostModel>? posts, String? message}) =>
      PostsState(status: status ?? this.status, posts: posts ?? this.posts, message: message ?? this.message);

  @override
  List<Object?> get props => [status, posts, message];
}
