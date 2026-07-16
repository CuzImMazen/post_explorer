import 'package:flutter/widgets.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/features/posts/presentation/widgets/comment_card.dart';

class CommentList extends StatelessWidget {
  const CommentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,

      separatorBuilder: (context, index) {
        return const VerticalSpacing(height: AppSpacing.md);
      },

      itemBuilder: (context, index) {
        return const CommentCard();
      },
    );
  }
}
