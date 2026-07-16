import 'package:get/get.dart';
import 'package:post_explorer/core/di/comments_binding.dart';
import 'package:post_explorer/core/di/posts_binding.dart';
import 'package:post_explorer/features/posts/presentation/screens/posts_detail_screen.dart';
import 'package:post_explorer/features/posts/presentation/screens/posts_list_screen.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.posts,
      page: () => PostsListScreen(),
      bindings: [PostsBinding()],
    ),
    GetPage(
      name: AppRoutes.postDetail,
      page: () => PostsDetailScreen(),
      bindings: [CommentsBinding(), PostsBinding()],
    ),
  ];
}
