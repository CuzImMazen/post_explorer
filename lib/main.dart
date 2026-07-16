import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:post_explorer/core/di/app_bindings.dart';
import 'package:post_explorer/core/theme/app_theme.dart';
import 'package:post_explorer/features/posts/presentation/screens/posts_list_screen.dart';

void main() {
  runApp(const PostsExplorer());
}

class PostsExplorer extends StatelessWidget {
  const PostsExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      title: 'Post Explorer',
      theme: AppTheme.lightTheme,
      home: const PostsListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
