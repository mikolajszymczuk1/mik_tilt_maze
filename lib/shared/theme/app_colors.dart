import 'package:flutter/material.dart';

final class AppColors {
  static const accentPurple = Color(0xFF5646E8);
  static const accentLight = Color(0xFFFFFFFF);
  static const accentYellow = Color(0xFFFFE347);

  static const surface0 = Color(0xFFF6F3EC);
  static const surface1 = Color(0xFFEDE8DE);

  static const textPrimary = Color(0xFF1B1712);
}

final class AppColorsGroup {
  Color get accentPurple => AppColors.accentPurple;
  Color get accentLight => AppColors.accentLight;
  Color get accentYellow => AppColors.accentYellow;

  Color get surface0 => AppColors.surface0;
  Color get surface1 => AppColors.surface1;

  Color get textPrimary => AppColors.textPrimary;
}
