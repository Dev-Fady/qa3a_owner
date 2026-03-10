import 'package:flutter/material.dart';

class AppColors {
  // Primary brand color (blue from Qa3a logo)
  static const Color primary = Color(0xFF1A73E8);
  static const Color primaryLight = Color(0xFF4A9EF5);
  static const Color primaryDark = Color(0xFF0D5BBF);

  // Background colors
  static const Color background = Color(0xFFF8FAFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text colors
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFFB0BAC9);

  // Input fields
  static const Color inputBackground = Color(0xFFF1F5FB);
  static const Color inputBorder = Color(0xFFDDE3F0);
  static const Color inputFocusBorder = Color(0xFF1A73E8);

  // Tab
  static const Color tabActive = Color(0xFF1A73E8);
  static const Color tabInactive = Color(0xFFE8EDF7);
  static const Color tabTextActive = Color(0xFFFFFFFF);
  static const Color tabTextInactive = Color(0xFF6B7280);

  // Divider / border
  static const Color divider = Color(0xFFE8EDF7);

  // Error
  static const Color error = Color(0xFFEF4444);
}

class AppTextStyles {
  static const String fontFamily = 'Cairo';

  static TextStyle heading1 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle heading2 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle body1 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static TextStyle body2 = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle label = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle hint = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
  );

  static TextStyle button = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static TextStyle tab = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}
