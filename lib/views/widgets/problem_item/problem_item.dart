import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/models/feedback_model.dart';
import 'package:fmanager/views/widgets/base_circle_avatar/base_circle_avatar.dart';

class ProblemItem extends StatelessWidget {
  const ProblemItem({
    super.key,
    this.onTap,
    required this.feedBackModel,
  });

  final FeedBackModel feedBackModel;

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
          height: 110.h,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: BaseCircleAvatar(
                  imageUrl: feedBackModel.user.url.toString() == '' ? IMAGE_URL : feedBackModel.user.url.toString(),
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        feedBackModel.category.categoryName.toString(),
                        style: themeData.textTheme.displayLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text.rich(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        TextSpan(
                          text: 'Người tiếp nhận: ',
                          style: themeData.textTheme.displayMedium,
                          children: [
                            TextSpan(
                              text: 'Chưa xử lý',
                              style: themeData.textTheme.displayMedium!.copyWith(
                                color: themeData.colorScheme.onBackground,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Tầng ${feedBackModel.room.floor.toString()} - Phòng ${feedBackModel.room.roomName.toString()}',
                        style: themeData.textTheme.displayMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '08/02/2023 | 09:02 am',
                        style: themeData.textTheme.displayMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
