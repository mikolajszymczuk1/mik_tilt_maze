import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';

class BaseButton extends StatefulWidget {
  final String? text;
  final String? subText;
  final BaseIconName? icon;
  final void Function()? onPressed;
  final bool centerContent;
  final bool isHighlighted;
  final bool withoutIconContainer;

  const BaseButton({
    super.key,
    this.text,
    this.subText,
    this.icon,
    this.onPressed,
    this.centerContent = false,
    this.isHighlighted = false,
    this.withoutIconContainer = false,
  });

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton>
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
            backgroundColor: widget.isHighlighted
                ? context.colors.accentPurple
                : context.colors.accentLight,
            padding: EdgeInsets.all(context.spacing.md),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.spacing.mdLg),
              side: widget.isHighlighted
                  ? BorderSide.none
                  : BorderSide(color: context.colors.surface1, width: 1),
            ),
            animationDuration: Duration.zero,
            overlayColor: widget.isHighlighted
                ? context.colors.accentLight.withValues(alpha: 0.15)
                : context.colors.accentPurple.withValues(alpha: 0.15),
          ),
          child: Row(
            children: [
              if (widget.icon != null)
                Container(
                  width: widget.withoutIconContainer
                      ? null
                      : context.spacing.xxxl,
                  height: widget.withoutIconContainer
                      ? null
                      : context.spacing.xxxl,
                  alignment: Alignment.center,
                  decoration: widget.withoutIconContainer
                      ? null
                      : BoxDecoration(
                          color: widget.isHighlighted
                              ? context.colors.accentLight.withValues(
                                  alpha: 0.08,
                                )
                              : context.colors.accentPurple.withValues(
                                  alpha: 0.08,
                                ),
                          borderRadius: BorderRadius.circular(
                            context.spacing.sm,
                          ),
                        ),
                  child: BaseIcon(
                    name: widget.icon!,
                    color: widget.isHighlighted
                        ? context.colors.accentLight
                        : context.colors.accentPurple,
                  ),
                ),
              Gap(context.spacing.sm),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.text != null)
                    BaseText(
                      widget.text!,
                      color: widget.isHighlighted
                          ? context.colors.accentLight
                          : context.colors.textPrimary,
                      type: BaseTextType.medium,
                    ),
                  if (widget.subText != null)
                    BaseText(
                      widget.subText!,
                      color: widget.isHighlighted
                          ? context.colors.accentLight.withValues(alpha: 0.8)
                          : context.colors.textPrimary.withValues(alpha: 0.8),
                      type: BaseTextType.tiny,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
