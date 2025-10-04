import 'package:bloclabs/get_api_demo/bloc/posts_bloc.dart';
import 'package:bloclabs/get_api_demo/bloc/posts_state.dart';
import 'package:bloclabs/get_api_demo/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Posts"), centerTitle: true),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            switch (state.status) {
              case PostsStatus.loading:
                return Center(child: CircularProgressIndicator());
              case PostsStatus.success:
                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Name: ${state.posts[index].name ?? ""}\nEmail: ${state.posts[index].email ?? ""}"),
                      subtitle: Text(state.posts[index].body ?? ""),
                    );
                  },
                );
              case PostsStatus.failure:
                return Center(child: Text(state.message));
            }
          },
        ),
      ),
    );
  }
}
