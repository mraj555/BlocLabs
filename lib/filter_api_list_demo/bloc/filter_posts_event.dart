// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class FilterPostsEvent extends Equatable {
  const FilterPostsEvent();

  @override
  List<Object?> get props => [];
}

class PostsFetched extends FilterPostsEvent {}

class SearchItem extends FilterPostsEvent {
  String item;

  SearchItem(this.item);

  @override
  List<Object?> get props => [item];
}
