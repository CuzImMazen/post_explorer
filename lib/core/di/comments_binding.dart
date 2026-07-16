import 'package:get/get.dart';
import 'package:post_explorer/features/posts/controllers/comments_controller.dart';
import 'package:post_explorer/features/posts/data/repositories/posts_repository.dart';

class CommentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentsController>(
      () => CommentsController(Get.find<PostsRepository>()),
    );
  }
}
