import 'package:flutter/material.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/core/theme/app_textstyles.dart';
import 'package:post_explorer/features/posts/data/models/comment_model.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});
  final CommentModel comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(comment.name, style: AppTextstyles.titleMedium),
            VerticalSpacing(height: AppSpacing.sm),
            Text(comment.email, style: AppTextstyles.bodyMedium),
            VerticalSpacing(height: AppSpacing.md),
            Text(
              comment.body,
              style: AppTextstyles.bodyMedium.copyWith(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
