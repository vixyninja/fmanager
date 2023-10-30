import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/models/models.dart';
import 'package:fmanager/views/teacher/history/history/teacher_history_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class TeacherHistoryView extends GetView<TeacherHistoryLogic> {
  const TeacherHistoryView({Key? key}) : super(key: key);

  @override
  TeacherHistoryLogic get controller => Get.put<TeacherHistoryLogic>(TeacherHistoryLogic());

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      body: Container(
        margin: EdgeInsets.only(top: 40.h),
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
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemBuilder: (context, index) {
                    final FeedBackModel feedBackModel = controller.listFeedBack[index];
                    return Container(
                      margin: EdgeInsets.only(left: 16.r, right: 16.r),
                      child: ProblemItem(
                        feedBackModel: feedBackModel,
                        onTap: () => controller.navigateToProblemRequest(),
                      ),
                    );
                  },
                  itemCount: controller.listFeedBack.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                ),
              ),
            ),
            27.verticalSpace,
          ],
        ),
      ),
    );
  }
}
