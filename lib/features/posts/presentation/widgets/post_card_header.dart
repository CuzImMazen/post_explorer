import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_explorer/core/theme/app_colors.dart';
import 'package:post_explorer/features/posts/controllers/posts_controller.dart';

class PostCardHeader extends StatelessWidget {
  const PostCardHeader({
    super.key,
    required this.postNumber,
    required this.insideDetailScreen,
  });
  final int postNumber;
  final bool insideDetailScreen;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostsController>();
    return Row(
      children: [
        PostNumberCard(postNumber: postNumber),
        Spacer(),
        //Favorite Button
        if (!insideDetailScreen)
          Obx(
            () => IconButton(
              icon: controller.isFavorite(postNumber)
                  ? Icon(Icons.favorite, color: AppColors.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: () => controller.toggleFavorite(postNumber),
            ),
          ),
      ],
    );
  }
}

class PostNumberCard extends StatelessWidget {
  const PostNumberCard({super.key, required this.postNumber});
  final int postNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(30),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          "Post #$postNumber",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
