import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_explorer/core/constants/app_assets.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/core/enums/enums.dart';
import 'package:post_explorer/core/widgets/info_widget.dart';
import 'package:post_explorer/features/posts/controllers/comments_controller.dart';

import 'package:post_explorer/features/posts/presentation/widgets/comment_card.dart';
import 'package:post_explorer/features/posts/presentation/widgets/comment_card_shimmer.dart';

class CommentList extends StatelessWidget {
  const CommentList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CommentsController>();

    return Obx(() {
      switch (controller.state.value) {
        case ScreenState.initial:
          return const SizedBox();

        case ScreenState.loading:
          return ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (context, index) {
              return const VerticalSpacing(height: AppSpacing.md);
            },
            itemBuilder: (context, index) {
              return const CommentCardShimmer();
            },
          );

        case ScreenState.failure:
          return ListView(
            children: [
              InfoWidget(
                title: 'Failed to load comments',
                subtitle: controller.errorMessage.value,
                onRetry: () => controller.getPostComments(controller.post.id),
                showRetryButton: true,
              ),
            ],
          );

        case ScreenState.empty:
          return InfoWidget(
            asset: AppAssets.emptyPosts,
            title: 'No Comments Yet',
            subtitle: 'Be the first to say something!',
          );

        case ScreenState.success:
          return RefreshIndicator(
            onRefresh: () => controller.getPostComments(controller.post.id),
            child: ListView.separated(
              itemCount: controller.comments.length,
              separatorBuilder: (context, index) {
                return const VerticalSpacing(height: AppSpacing.md);
              },
              itemBuilder: (context, index) {
                final comment = controller.comments[index];
                return CommentCard(comment: comment);
              },
            ),
          );
      }
    });
  }
}
