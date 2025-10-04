import 'package:bloc/bloc.dart';
import 'package:bloclabs/get_api_demo/bloc/posts_event.dart';
import 'package:bloclabs/get_api_demo/bloc/posts_state.dart';
import 'package:bloclabs/get_api_demo/repository/post_repository.dart';
import 'package:bloclabs/get_api_demo/utils/enums.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostRepository repo = PostRepository();

  PostsBloc() : super(const PostsState()) {
    on<PostsFetched>(onFetchPosts);
    add(PostsFetched());
  }

  Future<void> onFetchPosts(PostsFetched event, Emitter<PostsState> emit) async {
    await repo
        .onFetchPosts()
        .then((value) {
          emit(state.copyWith(status: PostsStatus.success, posts: value, message: 'Success'));
        })
        .catchError((error, stackTrace) {
          emit(state.copyWith(status: PostsStatus.failure, message: error.toString()));
        });
  }
}
