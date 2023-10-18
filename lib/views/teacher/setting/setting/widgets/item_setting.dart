import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting({
    Key? key,
    required this.title,
    required this.onTap,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  Widget _buildPrefixIcon() {
    if (prefixIcon == null) {
      return Container();
    }
    return prefixIcon!;
  }

  Widget _buildSuffixIcon() {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: suffixIcon ?? const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        highlightColor: themeData.colorScheme.primary.withOpacity(0.1),
        splashColor: themeData.colorScheme.primary.withOpacity(0.1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              _buildSuffixIcon(),
              20.horizontalSpace,
              Text(
                title,
                style: themeData.textTheme.displayMedium!.copyWith(
                  color: themeData.colorScheme.primary,
                ),
              ),
              const Spacer(),
              _buildPrefixIcon()
            ],
          ),
        ),
      ),
    );
  }
}
