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

  final posts = <PostModel>[].obs;
  final filteredPosts = <PostModel>[].obs;
  final state = ScreenState.initial.obs;
  final errorMessage = ''.obs;
  final searchQuery = ''.obs;
  final favoriteIds = <int>{}.obs;

  // Fetch posts
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
          searchPosts(searchQuery.value);
        }
      },
    );
  }

  // Search

  void searchPosts(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredPosts.assignAll(posts);
      state.value = posts.isEmpty ? ScreenState.empty : ScreenState.success;
      return;
    }

    final result = posts.where(
      (post) => post.title.toLowerCase().contains(query.toLowerCase()),
    );

    filteredPosts.assignAll(result);

    if (filteredPosts.isEmpty) {
      state.value = ScreenState.empty;
    } else {
      state.value = ScreenState.success;
    }
  }

  // Favorite

  void toggleFavorite(int postId) {
    if (favoriteIds.contains(postId)) {
      favoriteIds.remove(postId);
    } else {
      favoriteIds.add(postId);
    }

    favoriteIds.refresh();
  }

  bool isFavorite(int postId) {
    return favoriteIds.contains(postId);
  }
}
