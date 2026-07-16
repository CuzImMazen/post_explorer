import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_explorer/core/constants/app_assets.dart';

import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/core/enums/enums.dart';
import 'package:post_explorer/core/widgets/info_widget.dart';
import 'package:post_explorer/features/posts/controllers/posts_controller.dart';
import 'package:post_explorer/features/posts/presentation/widgets/post_card.dart';
import 'package:post_explorer/features/posts/presentation/widgets/post_card_shimmer.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostsController>();

    return Obx(() {
      switch (controller.state.value) {
        case ScreenState.initial:
          return const SizedBox();

        case ScreenState.loading:
          return ListView.separated(
            itemCount: 5,

            separatorBuilder: (context, index) {
              return const VerticalSpacing(height: AppSpacing.md);
            },

            itemBuilder: (context, index) {
              return const PostCardShimmer();
            },
          );

        case ScreenState.failure:
          return RefreshIndicator(
            onRefresh: controller.getPosts,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                InfoWidget(
                  asset: AppAssets.postsFail,
                  title: 'Something went wrong',
                  subtitle: controller.errorMessage.value,
                  onRetry: controller.getPosts,
                  showRetryButton: true,
                ),
              ],
            ),
          );

        case ScreenState.empty:
          return RefreshIndicator(
            onRefresh: controller.getPosts,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                InfoWidget(
                  asset: AppAssets.emptyPosts,
                  title: 'No Posts Found',
                  subtitle: 'Pull down to refresh',
                ),
              ],
            ),
          );

        case ScreenState.success:
          return RefreshIndicator(
            onRefresh: controller.getPosts,
            child: ListView.separated(
              itemCount: controller.filteredPosts.length,

              separatorBuilder: (context, index) {
                return const VerticalSpacing(height: AppSpacing.md);
              },

              itemBuilder: (context, index) {
                final post = controller.filteredPosts[index];

                return PostCard(post: post);
              },
            ),
          );
      }
    });
  }
}
