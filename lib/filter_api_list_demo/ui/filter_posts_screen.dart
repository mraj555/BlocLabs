import 'dart:developer';

import 'package:bloclabs/filter_api_list_demo/bloc/filter_posts_bloc.dart';
import 'package:bloclabs/filter_api_list_demo/bloc/filter_posts_event.dart';
import 'package:bloclabs/filter_api_list_demo/bloc/filter_posts_state.dart';
import 'package:bloclabs/filter_api_list_demo/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterPostsScreen extends StatelessWidget {
  const FilterPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Posts"), centerTitle: true),
        body: BlocBuilder<FilterPostsBloc, FilterPostsState>(
          builder: (context, state) {
            switch (state.status) {
              case FilterPostsStatus.loading:
                return Center(child: CircularProgressIndicator());
              case FilterPostsStatus.success:
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'Search with email', border: OutlineInputBorder()),
                        onChanged: (value) => context.read<FilterPostsBloc>().add(SearchItem(value)),
                      ),
                    ),
                    Expanded(
                      child: state.search_message.trim().isNotEmpty
                          ? Center(child: Text(state.search_message))
                          : ListView.builder(
                              itemCount: state.temp_posts.isNotEmpty ? state.temp_posts.length : state.posts.length,
                              itemBuilder: (context, index) {
                                final item = state.temp_posts.isNotEmpty ? state.temp_posts[index] : state.posts[index];
                                return ListTile(
                                  title: Text("Name: ${item.name ?? ""}\nEmail: ${item.email ?? ""}"),
                                  subtitle: Text(item.body ?? ""),
                                );
                              },
                            ),
                    ),
                  ],
                );
              case FilterPostsStatus.failure:
                return Center(child: Text(state.message));
            }
          },
        ),
      ),
    );
  }
}
