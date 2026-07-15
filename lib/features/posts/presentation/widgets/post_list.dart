import 'package:flutter/material.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/features/posts/presentation/widgets/post_card.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) =>
            const VerticalSpacing(height: AppSpacing.md),
        itemBuilder: (context, index) {
          return const PostCard();
        },
      ),
    );
  }
}
