import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/views/teacher/home/report_problem/report_problem_logic.dart';
import 'package:get/get.dart';

class ReportProblemView extends GetView<ReportProblemLogic> {
  ReportProblemView({super.key});

  final ReportProblemLogic logic = Get.put<ReportProblemLogic>(ReportProblemLogic());

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.secondary,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Báo cáo sự cố',
          style: themeData.textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 20.sp),
        ),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleTextStyle: themeData.textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 20.sp),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: themeData.colorScheme.background,
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              40.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 50.h),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: 'Phòng học',
                  hintStyle: themeData.textTheme.displayMedium!.copyWith(
                    fontSize: 16.sp,
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  isDense: true,
                ),
                style: themeData.textTheme.displayLarge!.copyWith(
                  fontSize: 16.sp,
                  color: themeData.colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                clipBehavior: Clip.none,
                controller: controller.roomController,
                enableSuggestions: true,
                cursorColor: themeData.colorScheme.secondary,
              ),
              16.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 50.h),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: 'Sự cố gặp phải',
                  hintStyle: themeData.textTheme.displayMedium!.copyWith(
                    fontSize: 16.sp,
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  isDense: true,
                ),
                style: themeData.textTheme.displayLarge!.copyWith(
                  fontSize: 16.sp,
                  color: themeData.colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                clipBehavior: Clip.none,
                controller: controller.problemController,
                enableSuggestions: true,
                cursorColor: themeData.colorScheme.secondary,
              ),
              16.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: 'Mô tả chi tiết',
                  hintStyle: themeData.textTheme.displayMedium!.copyWith(
                    fontSize: 16.sp,
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  isDense: true,
                ),
                style: themeData.textTheme.displayLarge!.copyWith(
                  fontSize: 16.sp,
                  color: themeData.colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
                textInputAction: TextInputAction.next,
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.descriptionController,
                enableSuggestions: true,
                cursorColor: themeData.colorScheme.secondary,
                minLines: 5,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                scrollPhysics: const BouncingScrollPhysics(),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: themeData.colorScheme.background,
                  backgroundColor: themeData.colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side: BorderSide(color: themeData.colorScheme.secondary),
                  ),
                  minimumSize: Size(double.infinity, 48.h),
                  animationDuration: const Duration(milliseconds: 500),
                ),
                child: Text(
                  'Gửi yêu cầu',
                  style: themeData.textTheme.displayLarge!.copyWith(color: Colors.white),
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
