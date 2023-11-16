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
    this.subtitle,
    this.colorSubtitle,
    this.pathAvatarIcon,
  });

  final String? title;
  final Color? colorTitle;
  final double? height;
  final double? width;
  final String? pathSuffixIcon;
  final Color? colorSuffixIcon;
  final String? urlAvatar;
  final String? subtitle;
  final Color? colorSubtitle;
  final VoidCallback? onTapSuffixIcon;
  final VoidCallback? onTapAvatarIcon;
  final VoidCallback? onTapTitle;
  final String? pathAvatarIcon;

  Widget suffixIcon(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return IconButton(
      onPressed: onTapSuffixIcon,
      icon: SvgPicture.asset(
        pathSuffixIcon!,
        colorFilter: ColorFilter.mode(
          colorSuffixIcon ?? theme.colorScheme.onBackground,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
          pathSuffixIcon: pathAvatarIcon,
        ),
        12.horizontalSpace,
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: onTapTitle,
              child: Text(
                title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: colorTitle ?? theme.colorScheme.onBackground),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              subtitle ?? '',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: colorSubtitle ?? theme.colorScheme.onBackground),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        const Spacer(),
        pathSuffixIcon != null ? suffixIcon(context) : const SizedBox(),
      ],
    );
  }
}
