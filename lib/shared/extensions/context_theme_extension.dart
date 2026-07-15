import 'package:flutter/material.dart';
import 'package:mik_tilt_maze/shared/theme/app_colors.dart';
import 'package:mik_tilt_maze/shared/theme/app_spacing.dart';
import 'package:mik_tilt_maze/shared/theme/app_typography.dart';

extension ContextThemeExtension on BuildContext {
  AppColorsGroup get colors => AppColorsGroup();
  AppSpacingGroup get spacing => AppSpacingGroup();
  AppTypographyGroup get typography => AppTypographyGroup();
}
