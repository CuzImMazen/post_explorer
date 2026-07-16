import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:post_explorer/core/constants/spacing/app_spacing.dart';
import 'package:post_explorer/core/constants/spacing/horizontal_spacing.dart';
import 'package:post_explorer/core/constants/spacing/vertcial_spacing.dart';
import 'package:post_explorer/core/theme/app_colors.dart';
import 'package:post_explorer/core/theme/app_textstyles.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.asset,
    this.showRetryButton = false,
    this.onRetry,
  });
  final String asset;
  final String title;
  final String subtitle;
  final bool showRetryButton;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final svgSize = screenSize.width * 0.5;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SvgPicture.asset(
            asset,
            width: svgSize,
            height: svgSize,
            fit: BoxFit.contain,
          ),
          VerticalSpacing(height: AppSpacing.md),
          Text(title, style: AppTextstyles.titleMedium),
          VerticalSpacing(height: AppSpacing.md),
          Text(subtitle, style: AppTextstyles.bodyMedium),
          VerticalSpacing(height: AppSpacing.md),
          if (showRetryButton)
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh, color: Colors.white),
                  HorizontalSpacing(width: AppSpacing.sm),

                  const Text('Retry', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
