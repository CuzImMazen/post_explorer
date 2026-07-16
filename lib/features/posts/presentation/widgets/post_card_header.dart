import 'package:flutter/material.dart';
import 'package:post_explorer/core/theme/app_colors.dart';

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
    return Row(
      children: [
        PostNumberCard(postNumber: postNumber),
        Spacer(),
        //Favorite Button
        if (!insideDetailScreen)
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
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
