import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';

Future<T?> showBaseModalBottomSheet<T>({
  required BuildContext context,
  required Widget child,
}) => showModalBottomSheet<T>(
  context: context,
  useRootNavigator: true,
  isScrollControlled: true,
  backgroundColor: context.colors.surface1,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(context.spacing.xl),
    ),
  ),
  constraints: BoxConstraints(
    maxHeight:
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
  ),
  builder: (sheetContext) => Padding(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
    ),
    child: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(context.spacing.md),
          Container(
            width: 56,
            height: context.spacing.xs,
            decoration: BoxDecoration(
              color: context.colors.textPrimary.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(context.spacing.xxs),
            ),
          ),
          Padding(padding: EdgeInsets.all(context.spacing.lg), child: child),
        ],
      ),
    ),
  ),
);
