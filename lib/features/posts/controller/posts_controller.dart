import 'package:get/get.dart';
import 'package:post_explorer/core/enums/enums.dart';
import 'package:post_explorer/features/posts/data/models/post_model.dart';
import 'package:post_explorer/features/posts/data/repositories/posts_repository.dart';

class PostsController extends GetxController {
  PostsController(this.postsRepository);

  final PostsRepository postsRepository;

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  // initial state
  final posts = <PostModel>[].obs;
  final state = ScreenState.initial.obs;
  final errorMessage = ''.obs;

  Future<void> getPosts() async {
    state.value = ScreenState.loading;
    final result = await postsRepository.getPosts();
    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        state.value = ScreenState.failure;
      },
      (data) {
        if (data.isEmpty) {
          state.value = ScreenState.empty;
        } else {
          posts.assignAll(data);
          state.value = ScreenState.success;
        }
      },
    );
  }
}
