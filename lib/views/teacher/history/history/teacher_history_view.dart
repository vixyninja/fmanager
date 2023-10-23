import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/views/teacher/history/history/teacher_history_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class TeacherHistoryView extends GetView<TeacherHistoryLogic> {
  const TeacherHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                  color: themeData.colorScheme.background,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    27.verticalSpace,
                    Text(
                      'Lịch sử báo cáo sự cố',
                      style: themeData.textTheme.displayLarge!.copyWith(
                        color: themeData.colorScheme.onBackground,
                        fontSize: 20.sp,
                      ),
                    ),
                    27.verticalSpace,
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 10.r, left: 16.r, right: 16.r),
                          child: ProblemItem(
                            title: 'Su co ve quat may Su co ve quat may Su co ve quat may Su co ve quat may ',
                            subTitle: 'Nguyen Van A AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
                            onTap: () => controller.navigateToProblemRequest(),
                          ),
                        );
                      },
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                    27.verticalSpace,
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
