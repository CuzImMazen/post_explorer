import 'package:flutter/material.dart';
import 'package:post_explorer/core/theme/app_theme.dart';
import 'package:post_explorer/features/posts/presentation/screens/posts_list_screen.dart';

void main() {
  runApp(const PostsExplorer());
}

class PostsExplorer extends StatelessWidget {
  const PostsExplorer({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Explorer',
      theme: AppTheme.lightTheme,
      home: const PostsListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
