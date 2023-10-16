import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/utils/asset_manager.dart';

class FeatureButton extends StatelessWidget {
  const FeatureButton({
    super.key,
    required this.leading,
    required this.title,
    required this.onPressed,
  });

  final Widget leading;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Material(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      type: MaterialType.card,
      surfaceTintColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 400),
      color: Colors.grey.shade300,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 86.h,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 22,
                child: SvgPicture.asset(
                  AssetManager.getIconPath(IconManager.icEdit),
                ),
              ),
              Positioned.fill(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: Center(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: themeData.textTheme.displayLarge!.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}