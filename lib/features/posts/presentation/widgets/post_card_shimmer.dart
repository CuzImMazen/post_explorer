import 'package:flutter/material.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:shimmer/shimmer.dart';

class PostCardShimmer extends StatelessWidget {
  const PostCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Colors.grey[300]!;
    final Color highlightColor = Colors.grey[100]!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 24,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: baseColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // First Full-Width Line
            Container(
              width: double.infinity,
              height: 18,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            const SizedBox(height: 12),

            // Second Shorter Line (80% width)
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: 18,
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
            VerticalSpacing(height: AppSpacing.lg),
            // Third Full-Width Line (Thinner one)
            Container(
              width: double.infinity,
              height: 14,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            const SizedBox(height: 10),

            // Fourth Shorter Line (75% width)
            FractionallySizedBox(
              widthFactor: 0.75,
              child: Container(
                height: 14,
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
