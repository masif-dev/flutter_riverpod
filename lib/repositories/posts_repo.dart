import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/comments.dart';
import '../models/posts_model.dart';

class PostsRepo {
  Future<List<Posts>> fetchPostsFromApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<Posts> postsList = (json.decode(jsonEncode(body)) as List)
          .map((i) => Posts.fromJson(i))
          .toList();
      return postsList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Posts> fetchSinglePostFromApi(String postId) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return Posts.fromJson(body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Comments>> fetchComments() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<Comments> commentsList = (json.decode(jsonEncode(body)) as List)
          .map((i) => Comments.fromJson(i))
          .toList();
      return commentsList;
    } else {
      throw Exception('Failed to load comments data');
    }
  }
}
