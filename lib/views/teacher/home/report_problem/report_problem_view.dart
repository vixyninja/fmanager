import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/models/models.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/teacher/home/report_problem/report_problem_logic.dart';
import 'package:fmanager/views/widgets/base_button/base_button.dart';
import 'package:get/get.dart';

class ReportProblemView extends GetView<ReportProblemLogic> {
  const ReportProblemView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    Get.put<ReportProblemLogic>(ReportProblemLogic());
    Get.put<FeedBackRepository>(FeedbackRepositoryImpl(apiServices: Get.find<ApiServices>()));

    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Báo cáo sự cố',
          style: themeData.textTheme.displayLarge!.copyWith(color: themeData.colorScheme.background, fontSize: 20.sp),
        ),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: themeData.colorScheme.background),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleTextStyle: themeData.textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 20.sp),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: themeData.colorScheme.background,
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
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
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                onChanged: (value) => controller.onSearchRoom(value),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.roomController,
                enableSuggestions: true,
                cursorColor: Colors.black,
              ),
              16.verticalSpace,
              Obx(
                () {
                  if (controller.categories.isEmpty) {
                    return SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return LayoutBuilder(
                    builder: (context, constraints) => DropdownMenu<CategoryModel>(
                      enableFilter: true,
                      width: constraints.maxWidth,
                      onSelected: (CategoryModel? value) {},
                      dropdownMenuEntries:
                          controller.categories.map<DropdownMenuEntry<CategoryModel>>((CategoryModel value) {
                        return DropdownMenuEntry<CategoryModel>(
                          value: value,
                          label: value.categoryName,
                          enabled: true,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            textStyle: MaterialStateProperty.all(
                              themeData.textTheme.displayLarge!.copyWith(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            visualDensity: VisualDensity.compact,
                          ),
                        );
                      }).toList(),
                      textStyle: themeData.textTheme.displayLarge!.copyWith(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      requestFocusOnTap: true,
                      selectedTrailingIcon: const Icon(Icons.check),
                      leadingIcon: const Icon(Icons.category),
                      trailingIcon: const Icon(Icons.arrow_drop_down),
                      enableSearch: true,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.grey.shade200,
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
                        constraints: BoxConstraints(maxHeight: 50.h, maxWidth: double.infinity),
                      ),
                      hintText: 'Chọn danh mục',
                      menuHeight: 200.h,
                      menuStyle: const MenuStyle(
                        elevation: MaterialStatePropertyAll(0),
                        visualDensity: VisualDensity.comfortable,
                        alignment: Alignment.bottomLeft,
                        padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                        backgroundColor: MaterialStatePropertyAll(Colors.deepOrange),
                        shadowColor: MaterialStatePropertyAll(Colors.grey),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          side: BorderSide(color: Colors.grey),
                        )),
                      ),
                    ),
                  );
                },
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
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textInputAction: TextInputAction.next,
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.descriptionController,
                enableSuggestions: true,
                cursorColor: Colors.black,
                minLines: 5,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                scrollPhysics: const BouncingScrollPhysics(),
              ),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          foregroundColor: themeData.colorScheme.surface,
                          elevation: 1,
                        ),
                        child: Center(child: SvgPicture.asset(AssetManager.getIconPath(IconManager.icCamera)))),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          elevation: 1,
                          foregroundColor: themeData.colorScheme.surface,
                        ),
                        child: Center(child: SvgPicture.asset(AssetManager.getIconPath(IconManager.icImage)))),
                  ),
                ],
              ),
              const Spacer(),
              BaseButton(
                type: ButtonType.primary,
                elevation: 2,
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Gửi yêu cầu',
                    style: themeData.textTheme.displayLarge!.copyWith(
                      color: themeData.colorScheme.background,
                    ),
                  ),
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
