import 'package:bloc/bloc.dart';
import 'package:bloclabs/filter_api_list_demo/bloc/filter_posts_event.dart';
import 'package:bloclabs/filter_api_list_demo/bloc/filter_posts_state.dart';
import 'package:bloclabs/filter_api_list_demo/model/filter_post_model.dart';
import 'package:bloclabs/filter_api_list_demo/repository/filter_post_repository.dart';
import 'package:bloclabs/filter_api_list_demo/utils/enums.dart';

class FilterPostsBloc extends Bloc<FilterPostsEvent, FilterPostsState> {
  FilterPostRepository repo = FilterPostRepository();
  List<FilterPostModel> temp_posts = [];

  FilterPostsBloc() : super(const FilterPostsState()) {
    on<PostsFetched>(onFetchPosts);
    add(PostsFetched());
    on<SearchItem>(onSearchItem);
  }

  Future<void> onFetchPosts(PostsFetched event, Emitter<FilterPostsState> emit) async {
    await repo
        .onFetchPosts()
        .then((value) {
          emit(state.copyWith(status: FilterPostsStatus.success, posts: value, message: 'Success'));
        })
        .catchError((error, stackTrace) {
          emit(state.copyWith(status: FilterPostsStatus.failure, message: error.toString()));
        });
  }

  void onSearchItem(SearchItem event, Emitter<FilterPostsState> emit) {
    if (event.item.isEmpty) {
      emit(state.copyWith(temp_posts: [], search_message: ''));
    } else {
      temp_posts = state.posts.where((e) => e.email.toString().toLowerCase().contains(event.item.toLowerCase())).toList();
      if (temp_posts.isEmpty) {
        emit(state.copyWith(temp_posts: temp_posts, search_message: "No data found"));
      } else {
        emit(state.copyWith(temp_posts: temp_posts, search_message: ''));
      }
    }
  }
}
