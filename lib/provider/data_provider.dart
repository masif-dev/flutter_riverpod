import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/models/comments.dart';
import 'package:riverpod_sample/models/posts_model.dart';

import '../repositories/posts_repo.dart';

final postProvider = Provider<PostsRepo>((ref) => PostsRepo());
final postDataProvider = FutureProvider<List<Posts>>((ref) async {
  return ref.watch(postProvider).fetchPostsFromApi();
});
final commentsDataProvider = FutureProvider<List<Comments>>((ref) async {
  return ref.watch(postProvider).fetchComments();
});

final postDetailProvider =
    FutureProvider.family<Posts, String>((ref, id) async {
  return ref.watch(postProvider).fetchSinglePostFromApi(id);
});
