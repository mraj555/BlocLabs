import 'package:bloc/bloc.dart';
import 'package:bloclabs/favourite_app/bloc/favourite_event.dart';
import 'package:bloclabs/favourite_app/bloc/favourite_state.dart';
import 'package:bloclabs/favourite_app/model/favourite_item_model.dart';
import 'package:bloclabs/favourite_app/repository/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteState> {
  List<FavouriteItemModel> items = [];
  List<FavouriteItemModel> temp_items = [];
  FavouriteRepository repository;

  FavouriteBloc(this.repository) : super(const FavouriteState()) {
    on<FetchFavouriteList>(onFetchList);
    add(FetchFavouriteList());
    on<AddFavouriteItem>(_onAddFavouriteItem);
    on<SelectItem>(_onSelectItem);
    on<UnSelectItem>(_onUnSelectItem);
    on<DeleteItem>(_onDeleteItems);
  }

  Future<void> onFetchList(FetchFavouriteList event, Emitter<FavouriteState> emit) async {
    items = await repository.onFetchItems();
    emit(state.copyWith(items: List.from(items), status: ListStatus.success));
  }

  void _onAddFavouriteItem(AddFavouriteItem event, Emitter<FavouriteState> emit) {
    final index = items.indexWhere((e) => e.id == event.item.id);
    items[index] = event.item;

    if (temp_items.isNotEmpty) {
      final temp_index = temp_items.indexWhere((e) => e.id == event.item.id);
      if (temp_index != -1) temp_items[temp_index] = event.item;
    }
    emit(state.copyWith(items: List.from(items), temp_items: List.from(temp_items)));
  }

  void _onSelectItem(SelectItem event, Emitter<FavouriteState> emit) {
    temp_items.add(event.item);
    emit(state.copyWith(temp_items: List.from(temp_items)));
  }

  void _onUnSelectItem(UnSelectItem event, Emitter<FavouriteState> emit) {
    temp_items.remove(event.item);
    emit(state.copyWith(temp_items: List.from(temp_items)));
  }

  void _onDeleteItems(DeleteItem event, Emitter<FavouriteState> emit) {
    items.removeWhere((e) => temp_items.contains(e));
    temp_items.clear();
    emit(state.copyWith(items: List.from(items), temp_items: List.from(temp_items)));
  }
}
