import 'package:flutter/material.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/core/theme/app_colors.dart';
import 'package:post_explorer/core/theme/app_textstyles.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          children: [
            PostCardHeader(),
            VerticalSpacing(height: AppSpacing.md),
            //Post Title
            Text(
              "int occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: AppTextstyles.titleMedium,
            ),
            VerticalSpacing(height: AppSpacing.sm),
            // Post Body
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              style: AppTextstyles.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            //VerticalSpacing(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }
}

class PostCardHeader extends StatelessWidget {
  const PostCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(30),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              "Post #1",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Spacer(),
        //Favorite Button
        IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
      ],
    );
  }
}
