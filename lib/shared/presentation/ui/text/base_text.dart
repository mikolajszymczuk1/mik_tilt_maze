import 'package:flutter/material.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/theme/app_typography.dart';

enum BaseTextType { tiny, medium, large, huge }

class BaseText extends StatelessWidget {
  final String text;
  final bool? softWrap;
  final BaseTextType type;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Color? color;

  const BaseText(
    this.text, {
    super.key,
    this.softWrap,
    this.type = BaseTextType.medium,
    this.textAlign,
    this.overflow,
    this.color,
  });

  TextStyle get style {
    switch (type) {
      case BaseTextType.tiny:
        return AppTypography.textTiny;
      case BaseTextType.medium:
        return AppTypography.textMedium;
      case BaseTextType.large:
        return AppTypography.textLarge;
      case BaseTextType.huge:
        return AppTypography.textHuge;
    }
  }

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: style.copyWith(color: color ?? context.colors.textPrimary),
    softWrap: softWrap,
    textAlign: textAlign,
    overflow: overflow,
  );
}
