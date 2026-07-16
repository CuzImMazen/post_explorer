import 'package:flutter/material.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/horizontal_spacing.dart';
import 'package:post_explorer/core/theme/app_colors.dart';

class CommentDivider extends StatelessWidget {
  const CommentDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        children: [
          const Expanded(child: Divider(color: Colors.black12, thickness: 1.0)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.mode_comment_outlined,
                  color: AppColors.primary,
                  size: 20.0,
                ),
                HorizontalSpacing(width: AppSpacing.sm),
                Text(
                  'COMMENTS',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),

          const Expanded(child: Divider(color: Colors.black12, thickness: 1.0)),
        ],
      ),
    );
  }
}
