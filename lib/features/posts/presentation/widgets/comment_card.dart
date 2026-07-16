import 'package:flutter/material.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/core/theme/app_textstyles.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key});

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
            Text("Mazen Alrefai", style: AppTextstyles.titleMedium),
            VerticalSpacing(height: AppSpacing.sm),
            Text("mazenalrefai@gmail.com", style: AppTextstyles.bodyMedium),
            VerticalSpacing(height: AppSpacing.md),
            Text(
              "I'm a software engineer with a passion for building beautiful user experiences. I love to explore new technologies and push the boundaries of what's possible.",
              style: AppTextstyles.bodyMedium.copyWith(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
