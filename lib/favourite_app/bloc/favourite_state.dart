import 'package:bloclabs/favourite_app/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> items;
  final List<FavouriteItemModel> temp_items;
  final ListStatus status;

  const FavouriteState({this.items = const [], this.temp_items = const [], this.status = ListStatus.loading});

  FavouriteState copyWith({List<FavouriteItemModel>? items, List<FavouriteItemModel>? temp_items, ListStatus? status}) =>
      FavouriteState(items: items ?? this.items, temp_items: temp_items ?? this.temp_items, status: status ?? this.status);

  @override
  List<Object?> get props => [items, temp_items, status];
}
