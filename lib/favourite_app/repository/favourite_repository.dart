import 'package:bloclabs/favourite_app/model/favourite_item_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemModel>> onFetchItems() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_onGenerateList(12));
  }

  List<FavouriteItemModel> _onGenerateList(int length) {
    return List.generate(length, (index) => FavouriteItemModel(id: '$index', value: 'Item $index'));
  }
}
