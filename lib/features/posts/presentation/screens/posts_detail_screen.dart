import 'package:flutter/material.dart';
import 'package:post_explorer/core/theme/app_textstyles.dart';

class PostsDetailScreen extends StatelessWidget {
  const PostsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Details', style: AppTextstyles.titleLarge),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: Column(children: [Divider()]),
    );
  }
}
