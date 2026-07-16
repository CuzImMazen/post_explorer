import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:post_explorer/core/di/app_bindings.dart';
import 'package:post_explorer/core/routing/app_pages.dart';
import 'package:post_explorer/core/routing/app_routes.dart';
import 'package:post_explorer/core/theme/app_theme.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.posts,
      getPages: AppPages.pages,
    );
  }
}
