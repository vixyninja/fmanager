import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/teacher/history/history/teacher_history_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class TeacherHistoryView extends GetView<TeacherHistoryLogic> {
  const TeacherHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 52.h, bottom: 32.h),
                child: BaseHeader(
                  onTapAvatarIcon: () => Get.snackbar('Avatar', 'Avatar'),
                  onTapSuffixIcon: () => Get.defaultDialog(),
                  onTapTitle: () => Get.snackbar('Title', 'Title'),
                  pathSuffixIcon: AssetManager.getIconPath(IconManager.icBell),
                  title: 'Huỳnh Hồng Vỹ',
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                  color: themeData.colorScheme.background,
                ),
                child: Column(
                  children: [
                    27.verticalSpace,
                    Text(
                      'Lịch sử báo cáo sự cố',
                      style: themeData.textTheme.displayLarge!.copyWith(
                        color: themeData.colorScheme.onBackground,
                        fontSize: 20.sp,
                      ),
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 10.r, left: 16.r, right: 16.r),
                          child: ProblemItem(
                            title: 'A',
                            subTitle: '$index',
                            onTap: () => controller.navigateToProblemRequest(),
                          ),
                        );
                      },
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
