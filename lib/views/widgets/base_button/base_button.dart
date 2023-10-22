import 'package:flutter/material.dart';
import 'package:fmanager/core/theme/dark_color.dart';
import 'package:fmanager/core/theme/light_color.dart';

enum ButtonType { primary, secondary }

class BaseButton extends StatefulWidget {
  const BaseButton({super.key, this.onPressed, this.child, this.onLongPress, required this.type, this.elevation});

  final Widget? child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ButtonType type;
  final double? elevation;

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  _buildPrimary(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ElevatedButton(
      onPressed: widget.onPressed,
      clipBehavior: Clip.antiAlias,
      onLongPress: widget.onLongPress,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        surfaceTintColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: useColor(themeData, LightColors.buttonBackgroundColor, DarkColors.buttonBackgroundColor),
        foregroundColor: useColor(themeData, DarkColors.buttonBackgroundColor, LightColors.buttonBackgroundColor),
        disabledBackgroundColor:
            useColor(themeData, LightColors.buttonBackgroundColorDisabled, DarkColors.buttonBackgroundColorDisabled),
        elevation: widget.elevation ?? 0,
        shadowColor: useColor(themeData, LightColors.shadowColor, DarkColors.shadowColor),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        textStyle: themeData.textTheme.displayMedium?.copyWith(
          color: widget.onPressed != null
              ? useColor(themeData, LightColors.buttonTextColor, DarkColors.buttonTextColor)
              : useColor(themeData, LightColors.buttonTextColorDisabled, DarkColors.buttonTextColorDisabled),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
      child: widget.child,
    );
  }

  _buildSecondary(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ElevatedButton(
      onPressed: widget.onPressed,
      clipBehavior: Clip.antiAlias,
      onLongPress: widget.onLongPress,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        surfaceTintColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor:
            useColor(themeData, LightColors.buttonSecondaryBackgroundColor, DarkColors.buttonSecondaryBackgroundColor),
        foregroundColor:
            useColor(themeData, DarkColors.buttonSecondaryBackgroundColor, LightColors.buttonSecondaryBackgroundColor),
        disabledBackgroundColor: useColor(themeData, LightColors.buttonSecondaryBackgroundColorDisabled,
            DarkColors.buttonSecondaryBackgroundColorDisabled),
        elevation: widget.elevation ?? 0,
        shadowColor: useColor(themeData, LightColors.shadowColor, DarkColors.shadowColor),
        side: widget.onPressed != null
            ? BorderSide(
                width: 1,
                color:
                    useColor(themeData, LightColors.buttonSecondaryBorderColor, DarkColors.buttonSecondaryBorderColor),
                style: BorderStyle.solid,
              )
            : BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            width: 1,
            color: widget.onPressed != null
                ? useColor(themeData, LightColors.buttonSecondaryBorderColor, DarkColors.buttonSecondaryBorderColor)
                : useColor(themeData, LightColors.buttonSecondaryBorderColorDisabled,
                    DarkColors.buttonSecondaryBorderColorDisabled),
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        textStyle: themeData.textTheme.displayMedium?.copyWith(
          color: widget.onPressed != null
              ? useColor(themeData, LightColors.buttonSecondaryTextColor, DarkColors.buttonSecondaryTextColor)
              : useColor(
                  themeData, LightColors.buttonSecondaryTextColorDisabled, DarkColors.buttonSecondaryTextColorDisabled),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
      child: widget.child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == ButtonType.primary ? _buildPrimary(context) : _buildSecondary(context);
  }

  Color useColor(ThemeData themeData, Color color1, Color color2) =>
      themeData.brightness == Brightness.light ? color1 : color2;
}
