import 'package:bloclabs/favourite_app/bloc/favourite_bloc.dart';
import 'package:bloclabs/favourite_app/bloc/favourite_event.dart';
import 'package:bloclabs/favourite_app/bloc/favourite_state.dart';
import 'package:bloclabs/favourite_app/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatelessWidget {
  const FavouriteAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favourite App"),
          centerTitle: true,
          actions: [
            BlocBuilder<FavouriteBloc, FavouriteState>(
              builder: (context, state) {
                return Visibility(
                  visible: state.temp_items.isNotEmpty ? true : false,
                  child: IconButton(
                    onPressed: () => context.read<FavouriteBloc>().add(DeleteItem()),
                    icon: Icon(Icons.delete_rounded),
                    color: Colors.red,
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              switch (state.status) {
                case ListStatus.loading:
                  return Center(child: CircularProgressIndicator());
                case ListStatus.success:
                  return ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                            value: state.temp_items.contains(item) ? true : false,
                            onChanged: (value) {
                              if (value == true) {
                                context.read<FavouriteBloc>().add(SelectItem(item: item));
                              } else {
                                context.read<FavouriteBloc>().add(UnSelectItem(item: item));
                              }
                            },
                          ),
                          title: Text(
                            item.value,
                            style: TextStyle(
                              decoration: state.temp_items.contains(item) ? TextDecoration.lineThrough : null,
                              decorationColor: Colors.red,
                              color: state.temp_items.contains(item) ? Colors.red : Colors.white,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () => context.read<FavouriteBloc>().add(
                              AddFavouriteItem(
                                item: FavouriteItemModel(id: item.id, value: item.value, isFavourite: item.isFavourite ? false : true),
                              ),
                            ),
                            icon: item.isFavourite ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_outline_rounded),
                          ),
                        ),
                      );
                    },
                  );
                case ListStatus.failure:
                  return Center(child: Text("Something went wrong"));
              }
            },
          ),
        ),
      ),
    );
  }
}
