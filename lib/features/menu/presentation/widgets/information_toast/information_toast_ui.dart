import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';
import 'package:mik_tilt_maze/shared/theme/app_colors.dart';

class InformationToastUi extends StatelessWidget {
  final String value;
  final BaseIconName icon;
  final Color? iconColor;

  const InformationToastUi({
    super.key,
    required this.value,
    required this.icon,
    this.iconColor = AppColors.accentPurple,
  });

  @override
  Widget build(BuildContext context) => Container(
    height: context.spacing.xxxl,
    padding: EdgeInsets.symmetric(horizontal: context.spacing.md),
    decoration: BoxDecoration(
      color: context.colors.accentLight,
      border: Border.all(color: context.colors.surface1),
      borderRadius: BorderRadius.circular(context.spacing.lg),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BaseIcon(name: icon, color: iconColor),
        Gap(context.spacing.xs),
        BaseText(value),
      ],
    ),
  );
}
