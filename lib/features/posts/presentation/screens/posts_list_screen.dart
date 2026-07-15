import 'package:flutter/material.dart';
import 'package:post_explorer/core/constants/app_assets.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/core/theme/app_textstyles.dart';
import 'package:post_explorer/core/widgets/info_widget.dart';
import 'package:post_explorer/features/posts/presentation/widgets/post_list.dart';
import 'package:post_explorer/features/posts/presentation/widgets/search_textfield.dart';

class PostsListScreen extends StatelessWidget {
  const PostsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Explorer', style: AppTextstyles.titleLarge),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SearchTextfield(),
            VerticalSpacing(height: AppSpacing.md),
            Divider(),
            VerticalSpacing(height: AppSpacing.sm),
            // PostList(),
            // VerticalSpacing(height: AppSpacing.md),
            InfoWidget(
              asset: AppAssets.postsFail,
              title: "Something went wrong",
              subtitle: "Check your connection and retry",
              showRetryButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
