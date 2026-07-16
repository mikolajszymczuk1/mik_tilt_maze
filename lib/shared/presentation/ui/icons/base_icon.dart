import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/theme/app_spacing.dart';

enum BaseIconSize { tiny, small, medium, large, huge }

enum BaseIconName {
  compass,
  dice,
  gear,
  lock,
  mobile,
  pause,
  play,
  question,
  starEmpty,
  starFull,
  time,
  back,
}

List<BaseIconName> withOriginalColors = [];

class BaseIcon extends StatelessWidget {
  final BaseIconName name;
  final Color? color;
  final BaseIconSize size;

  const BaseIcon({
    super.key,
    required this.name,
    this.color,
    this.size = BaseIconSize.large,
  });

  double get _iconSize {
    switch (size) {
      case BaseIconSize.tiny:
        return AppSpacing.sm;
      case BaseIconSize.small:
        return AppSpacing.md;
      case BaseIconSize.medium:
        return AppSpacing.mdLg;
      case BaseIconSize.large:
        return AppSpacing.lg;
      case BaseIconSize.huge:
        return AppSpacing.xl;
    }
  }

  String get _iconPath => 'assets/icons/${name.name}.svg';

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    _iconPath,
    width: _iconSize,
    height: _iconSize,
    colorFilter: withOriginalColors.contains(name)
        ? null
        : ColorFilter.mode(
            color ?? context.colors.textPrimary,
            BlendMode.srcIn,
          ),
  );
}
