import 'package:flutter/material.dart';
import 'package:post_explorer/core/theme/app_colors.dart';

abstract final class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      toolbarHeight: 80,
      surfaceTintColor: Colors.transparent,
    ),
  );
}
