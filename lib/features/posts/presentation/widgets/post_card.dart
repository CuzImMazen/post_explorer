import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/core/routing/app_routes.dart';
import 'package:post_explorer/core/theme/app_textstyles.dart';
import 'package:post_explorer/features/posts/data/models/post_model.dart';
import 'package:post_explorer/features/posts/presentation/widgets/post_card_header.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
    this.insideDetailScreen = false,
  });
  final PostModel post;
  final bool insideDetailScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.postDetail, arguments: post);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostCardHeader(
                postNumber: post.id,
                insideDetailScreen: insideDetailScreen,
              ),
              VerticalSpacing(height: AppSpacing.md),
              //Post Title
              Text(post.title, style: AppTextstyles.titleMedium),
              VerticalSpacing(height: AppSpacing.sm),
              // Post Body
              Text(
                post.body,
                style: AppTextstyles.bodyMedium,
                overflow: insideDetailScreen ? null : TextOverflow.ellipsis,
                maxLines: insideDetailScreen ? null : 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
