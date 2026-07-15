import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mik_tilt_maze/shared/theme/app_colors.dart';
import 'package:mik_tilt_maze/shared/theme/app_spacing.dart';

final class AppTypography {
  static TextStyle get textTiny => GoogleFonts.spaceGrotesk(
    fontSize: AppSpacing.sm,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get textMedium => GoogleFonts.spaceGrotesk(
    fontSize: AppSpacing.md,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get textLarge => GoogleFonts.spaceGrotesk(
    fontSize: AppSpacing.lg,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle get textHuge => GoogleFonts.spaceGrotesk(
    fontSize: AppSpacing.xl,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
}

final class AppTypographyGroup {
  TextStyle get textTiny => AppTypography.textTiny;
  TextStyle get textMedium => AppTypography.textMedium;
  TextStyle get textLarge => AppTypography.textLarge;
  TextStyle get textHuge => AppTypography.textHuge;
}
