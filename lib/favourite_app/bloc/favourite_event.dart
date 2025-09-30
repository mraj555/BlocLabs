import 'package:bloclabs/favourite_app/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvents extends Equatable {
  const FavouriteEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteEvents {}

class AddFavouriteItem extends FavouriteEvents {
  final FavouriteItemModel item;

  const AddFavouriteItem({required this.item});

  @override
  List<Object?> get props => [item];
}

class SelectItem extends FavouriteEvents {
  final FavouriteItemModel item;

  const SelectItem({required this.item});

  @override
  List<Object?> get props => [item];
}

class UnSelectItem extends FavouriteEvents {
  final FavouriteItemModel item;

  const UnSelectItem({required this.item});

  @override
  List<Object?> get props => [item];
}

class DeleteItem extends FavouriteEvents {}