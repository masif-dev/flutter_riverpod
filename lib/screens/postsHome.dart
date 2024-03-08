import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/screens/postDetail.dart';
import '../provider/data_provider.dart';

class HomePosts extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postResp = ref.watch(postDataProvider);
    // Perform a switch-case on the result to handle loading/error states
    return Scaffold(
      body: SafeArea(
        child: postResp.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) =>
               Center(child: Text('error occurred: $error')),
          data: (postsList) => ListView.builder(
              itemCount: postsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onLongPress: () {},
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetailPage(postId: postsList[index].id!)));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          '${postsList[index].id}-${postsList[index].title!}',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(postsList[index].body ?? ''),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
