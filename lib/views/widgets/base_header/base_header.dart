import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/views/widgets/widget.dart';

class BaseHeader extends StatelessWidget {
  const BaseHeader({
    super.key,
    this.pathSuffixIcon,
    this.onTapSuffixIcon,
    this.onTapAvatarIcon,
    this.onTapTitle,
    this.title,
    this.urlAvatar,
    this.height,
    this.width,
    this.colorTitle,
    this.colorSuffixIcon,
  });

  final String? pathSuffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final Color? colorSuffixIcon;
  final String? urlAvatar;
  final VoidCallback? onTapAvatarIcon;
  final String? title;
  final VoidCallback? onTapTitle;
  final Color? colorTitle;
  final double? height;
  final double? width;

  Widget suffixIcon(BuildContext context) {
    return IconButton(
      onPressed: onTapSuffixIcon,
      icon: SvgPicture.asset(
        pathSuffixIcon!,
        colorFilter: ColorFilter.mode(
          colorSuffixIcon ?? Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BaseCircleAvatar(
          onTap: onTapAvatarIcon,
          imageUrl: urlAvatar,
          height: height ?? 48.h,
          width: width ?? 48.w,
        ),
        12.horizontalSpace,
        InkWell(
          onTap: onTapTitle,
          child: Text(
            title ?? '',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: colorTitle ?? Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        pathSuffixIcon != null ? suffixIcon(context) : const SizedBox(),
      ],
    );
  }
}
