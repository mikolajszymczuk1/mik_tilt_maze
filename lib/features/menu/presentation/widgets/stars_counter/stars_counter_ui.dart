import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';

class StarsCounterUi extends StatelessWidget {
  final String value;

  const StarsCounterUi({super.key, required this.value});

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
      children: [
        BaseIcon(
          name: BaseIconName.starFull,
          color: context.colors.accentYellow,
        ),
        Gap(context.spacing.xs),
        BaseText(value),
      ],
    ),
  );
}
