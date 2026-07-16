import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/core/theme/app_textstyles.dart';
import 'package:post_explorer/features/posts/data/models/post_model.dart';
import 'package:post_explorer/features/posts/presentation/widgets/comment_list.dart';
import 'package:post_explorer/features/posts/presentation/widgets/comments_divider.dart';
import 'package:post_explorer/features/posts/presentation/widgets/post_card.dart';

class PostsDetailScreen extends StatelessWidget {
  const PostsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostModel post = Get.arguments as PostModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Details', style: AppTextstyles.titleLarge),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Divider(),
          VerticalSpacing(height: AppSpacing.md),
          PostCard(post: post, insideDetailScreen: true),
          VerticalSpacing(height: AppSpacing.md),
          CommentDivider(),
          VerticalSpacing(height: AppSpacing.md),
          Expanded(child: CommentList()),
          VerticalSpacing(height: AppSpacing.md),
        ],
      ),
    );
  }
}
