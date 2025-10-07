import 'dart:convert';

import 'package:bloclabs/filter_api_list_demo/model/filter_post_model.dart';
import 'package:http/http.dart' as http;

class FilterPostRepository {
  Future<List<FilterPostModel>> onFetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final posts = json.decode(response.body) as List;
      return posts.map((e) => FilterPostModel.fromJson(e)).toList();
    }
    throw Exception("Error on fetching posts");
  }
}
