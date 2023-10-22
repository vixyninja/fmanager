import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/views/widgets/base_circle_avatar/base_circle_avatar.dart';

class ProblemItem extends StatelessWidget {
  const ProblemItem({super.key, required this.title, required this.subTitle, this.onTap});

  final String title;
  final String subTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Material(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      surfaceTintColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 400),
      color: themeData.colorScheme.background,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      type: MaterialType.card,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.all(16.r),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
          ),
          height: 100.h,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title.length > 30
                      ? Text(
                          '${title.substring(0, 30)}...',
                          style: themeData.textTheme.displayLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : Text(
                          title,
                          style: themeData.textTheme.displayLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                  Text.rich(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                      text: 'Người tiếp nhận: ',
                      style: themeData.textTheme.displayMedium,
                      children: [
                        subTitle.length > 20
                            ? TextSpan(
                                text: '${subTitle.substring(0, 20)}...',
                                style: themeData.textTheme.displayMedium!.copyWith(
                                  color: themeData.colorScheme.onBackground,
                                ),
                              )
                            : TextSpan(
                                text: subTitle,
                                style: themeData.textTheme.displayMedium!.copyWith(
                                  color: themeData.colorScheme.onBackground,
                                ),
                              ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text('08-02-2023'),
                      10.horizontalSpace,
                      const Text('09:05 am'),
                      10.horizontalSpace,
                      const Text('Phòng: T1101'),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Center(
                child: BaseCircleAvatar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
