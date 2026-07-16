import 'package:flutter/material.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';

class BaseIconButton extends StatefulWidget {
  final BaseIconName icon;
  final void Function()? onPressed;

  const BaseIconButton({super.key, required this.icon, this.onPressed});

  @override
  State<BaseIconButton> createState() => _BaseIconButtonState();
}

class _BaseIconButtonState extends State<BaseIconButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pressController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
    reverseDuration: const Duration(milliseconds: 250),
  );

  late final Animation<double> _scale = Tween<double>(begin: 1, end: 0.9)
      .animate(
        CurvedAnimation(
          parent: _pressController,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeOutBack,
        ),
      );

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Listener(
    onPointerDown: (_) => _pressController.forward(),
    onPointerUp: (_) => _pressController.reverse(),
    onPointerCancel: (_) => _pressController.reverse(),
    child: ScaleTransition(
      scale: _scale,
      child: RepaintBoundary(
        child: FilledButton(
          onPressed: widget.onPressed ?? () {},
          style: FilledButton.styleFrom(
            backgroundColor: context.colors.accentLight,
            shape: CircleBorder(
              side: BorderSide(color: context.colors.surface1, width: 1),
            ),
            padding: EdgeInsets.zero,
            minimumSize: Size(context.spacing.xxxl, context.spacing.xxxl),
            maximumSize: Size(context.spacing.xxxl, context.spacing.xxxl),
            animationDuration: Duration.zero,
            overlayColor: context.colors.accentPurple.withValues(alpha: 0.15),
          ),
          child: BaseIcon(name: widget.icon),
        ),
      ),
    ),
  );
}
