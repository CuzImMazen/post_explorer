import 'package:get/get.dart';
import 'package:post_explorer/core/enums/enums.dart';
import 'package:post_explorer/features/posts/data/models/comment_model.dart';
import 'package:post_explorer/features/posts/data/models/post_model.dart';
import 'package:post_explorer/features/posts/data/repositories/posts_repository.dart';

class CommentsController extends GetxController {
  CommentsController(this.postsRepository);

  final PostsRepository postsRepository;

  late final PostModel post;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is PostModel) {
      post = Get.arguments as PostModel;

      getPostComments(post.id);
    } else {
      errorMessage.value = "Failed to load post Comments";
      state.value = ScreenState.failure;
    }
  }

  final comments = <CommentModel>[].obs;
  final state = ScreenState.initial.obs;
  final errorMessage = ''.obs;

  Future<void> getPostComments(int postId) async {
    state.value = ScreenState.loading;
    final result = await postsRepository.getPostComments(postId);
    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        state.value = ScreenState.failure;
      },
      (data) {
        if (data.isEmpty) {
          state.value = ScreenState.empty;
        } else {
          comments.assignAll(data);

          state.value = ScreenState.success;
        }
      },
    );
  }
}
