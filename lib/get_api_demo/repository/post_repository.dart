import 'dart:convert';

import 'package:bloclabs/get_api_demo/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> onFetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final posts = json.decode(response.body) as List;
      return posts.map((e) => PostModel.fromJson(e)).toList();
    }
    throw Exception("Error on fetching posts");
  }
}
