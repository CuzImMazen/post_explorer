import 'package:flutter/material.dart';
import 'package:post_explorer/core/theme/app_colors.dart';

class PostCardHeader extends StatelessWidget {
  const PostCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PostNumberCard(),
        Spacer(),
        //Favorite Button
        IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
      ],
    );
  }
}

class PostNumberCard extends StatelessWidget {
  const PostNumberCard({super.key});

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
          "Post #1",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
