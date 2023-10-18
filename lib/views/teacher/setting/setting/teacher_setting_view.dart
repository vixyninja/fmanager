import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/views/teacher/setting/setting/teacher_setting_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class TeacherSettingView extends GetView<TeacherSettingLogic> {
  TeacherSettingView({Key? key}) : super(key: key);

  final TeacherSettingLogic teacherLogic = Get.find<TeacherSettingLogic>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.secondary,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            backgroundColor: themeData.colorScheme.secondary,
            toolbarHeight: kBottomNavigationBarHeight,
          ),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                27.verticalSpace,
                BaseCircleAvatar(
                  width: 81.w,
                  height: 81.h,
                  onTap: () {},
                ),
                7.verticalSpace,
                Text(
                  'Huynh Hong Vy',
                  style: themeData.textTheme.displayLarge!.copyWith(color: Colors.white),
                ),
                7.verticalSpace,
                Text(
                  '0396855834',
                  style: themeData.textTheme.displayMedium!.copyWith(color: Colors.white),
                ),
                50.verticalSpace,
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                      color: themeData.colorScheme.background,
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
