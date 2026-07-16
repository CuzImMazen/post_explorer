import 'package:get/get.dart';
import 'package:post_explorer/features/posts/controllers/posts_controller.dart';
import 'package:post_explorer/features/posts/data/repositories/posts_repository.dart';

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsController>(
      () => PostsController(Get.find<PostsRepository>()),
    );
  }
}
