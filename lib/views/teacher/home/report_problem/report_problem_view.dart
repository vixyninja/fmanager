import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fmanager/models/models.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/teacher/home/report_problem/report_problem_logic.dart';
import 'package:fmanager/views/widgets/base_button/base_button.dart';
import 'package:get/get.dart';

class ReportProblemView extends GetView<ReportProblemLogic> {
  const ReportProblemView({super.key});

  @override
  ReportProblemLogic get controller => Get.put<ReportProblemLogic>(ReportProblemLogic());

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

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
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: themeData.colorScheme.background,
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GetBuilder<ReportProblemLogic>(
                  init: controller,
                  builder: (controller) => TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: controller.roomController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
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
                      ),
                      style: themeData.textTheme.displayLarge!.copyWith(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      final list = await controller.onSearchRoom(pattern);
                      return list!
                        ..where((element) => element.roomName.toLowerCase().contains(pattern.toLowerCase()))
                        ..sort((a, b) => a.roomName.compareTo(b.roomName));
                    },
                    noItemsFoundBuilder: (context) => const SizedBox.shrink(
                      child: SizedBox.shrink(
                        child: Center(
                          child: Text('Không có dữ liệu'),
                        ),
                      ),
                    ),
                    loadingBuilder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    debounceDuration: const Duration(milliseconds: 500),
                    errorBuilder: (context, error) => const SizedBox.shrink(),
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: const Icon(Icons.meeting_room_sharp),
                        title: Text(
                          suggestion.roomName,
                          style: themeData.textTheme.displayLarge!.copyWith(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          '${suggestion.building} - ${suggestion.floor}',
                          style: themeData.textTheme.displayMedium!.copyWith(
                            fontSize: 14.sp,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      );
                    },
                    itemSeparatorBuilder: (context, index) => const Divider(height: 1),
                    onSuggestionSelected: (suggestion) {
                      controller.roomController.text = suggestion.roomName;
                      controller.room.value = suggestion;
                    },
                    suggestionsBoxDecoration: SuggestionsBoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 8.0,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
              ),
              16.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(
                  () {
                    if (controller.categories.isEmpty) {
                      return LayoutBuilder(
                        builder: (context, constraints) => DropdownMenu<CategoryModel>(
                          enableFilter: false,
                          width: constraints.maxWidth,
                          onSelected: (CategoryModel? value) {},
                          dropdownMenuEntries: const [],
                          textStyle: themeData.textTheme.displayLarge!.copyWith(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          requestFocusOnTap: true,
                          selectedTrailingIcon: const Icon(Icons.check),
                          leadingIcon: const Icon(Icons.category),
                          trailingIcon: SizedBox(height: 20.h, width: 20.w, child: const CircularProgressIndicator()),
                          enableSearch: false,
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
                          enabled: false,
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
                    }
                    return LayoutBuilder(
                      builder: (context, constraints) => DropdownMenu<CategoryModel>(
                        enableFilter: true,
                        width: constraints.maxWidth,
                        controller: controller.categoryController,
                        onSelected: (CategoryModel? value) => controller.categoryController.text = value!.categoryName,
                        dropdownMenuEntries: controller.categories.map<DropdownMenuEntry<CategoryModel>>(
                          (CategoryModel value) {
                            final String index = controller.categories.indexOf(value).toString();
                            final String label = '$index. ${value.categoryName} - ${value.categoryType}';
                            return DropdownMenuEntry<CategoryModel>(
                              value: value,
                              label: label,
                              enabled: true,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
                                foregroundColor: MaterialStateProperty.all(Colors.black),
                                textStyle: MaterialStateProperty.all(
                                  themeData.textTheme.displayLarge!.copyWith(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                visualDensity: VisualDensity.compact,
                              ),
                            );
                          },
                        ).toList(),
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
                          backgroundColor: MaterialStatePropertyAll(Colors.grey),
                          shadowColor: MaterialStatePropertyAll(Colors.grey),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              side: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              16.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextFormField(
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
                  minLines: 7,
                  maxLines: 7,
                  keyboardType: TextInputType.multiline,
                  scrollPhysics: const BouncingScrollPhysics(),
                ),
              ),
              16.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () async => await controller.captureImage(),
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
                          onPressed: () async => await controller.pickImages(),
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
              ),
              16.verticalSpace,
              Obx(
                () => SizedBox(
                  height: 250.h,
                  child: ListView.builder(
                    itemCount: controller.images.length,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    controller: controller.imageScrollController,
                    padding: EdgeInsets.only(left: 16.w),
                    reverse: true,
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(color: Colors.grey.shade200, width: 1),
                                    ),
                                    child: Image.file(
                                      File(controller.images[index].path),
                                      fit: BoxFit.cover,
                                      width: 200.w,
                                      height: 200.h,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                      icon: const Icon(Icons.close, color: Colors.red),
                                      onPressed: () => controller.images.removeAt(index),
                                    ),
                                  ),
                                ],
                              ),
                              4.verticalSpace,
                              Text('${index + 1}')
                            ]),
                      );
                    },
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: BaseButton(
                  type: ButtonType.primary,
                  elevation: 2,
                  onPressed: () {
                    controller.postProblemRequest();
                  },
                  child: Center(
                    child: Text(
                      'Gửi yêu cầu',
                      style: themeData.textTheme.displayLarge!.copyWith(
                        color: themeData.colorScheme.background,
                      ),
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
