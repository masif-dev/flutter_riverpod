import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/data_provider.dart';

class PostDetailPage extends ConsumerWidget {
  int postId;
  PostDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postDetailData = ref.watch(postDetailProvider(postId.toString()));
    return Scaffold(
      appBar:AppBar(),
      body: SafeArea(
      child: postDetailData.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) =>
            Center(child: Text('error occurred: $error')),
        data: (postData) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              title: Text(
                '${postData.id}-${postData.title!}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(postData.body ?? ''),
            ),
          ),
        ),
      ),
    ),);
  }
}
