import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';

class BaseTopNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  final List<Widget> children;
  final double height;

  const BaseTopNavigationBar({
    required this.children,
    super.key,
    this.height = kToolbarHeight,
  });

  static double get _topSafeAreaPadding {
    final view = PlatformDispatcher.instance.views.first;
    return view.padding.top / view.devicePixelRatio;
  }

  @override
  Widget build(BuildContext context) => Container(
    height: preferredSize.height,
    padding: EdgeInsets.symmetric(horizontal: context.spacing.lg),
    color: context.colors.surface0,
    child: SafeArea(bottom: false, child: Row(children: children)),
  );

  @override
  Size get preferredSize => Size.fromHeight(height + _topSafeAreaPadding);
}
