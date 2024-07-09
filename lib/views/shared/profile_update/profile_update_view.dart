import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/views/shared/profile_update/profile_update_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class ProfileUpdateView extends GetView<ProfileUpdateLogic> {
  const ProfileUpdateView({super.key});

  @override
  ProfileUpdateLogic get controller => Get.put<ProfileUpdateLogic>(ProfileUpdateLogic());

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: themeData.colorScheme.background,
          title: Obx(
            () => Text(
              controller.authLogic.userModel.value.name.toString(),
              style: themeData.textTheme.displayLarge!.copyWith(
                color: themeData.colorScheme.onBackground,
                fontSize: 18.sp,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios, color: themeData.colorScheme.onBackground),
          ),
          centerTitle: true,
          elevation: 0.0,
          automaticallyImplyLeading: true,
          surfaceTintColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            20.verticalSpace,
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  BaseCircleAvatar(
                    height: 160.h,
                    width: 160.w,
                    imageUrl: controller.authLogic.userModel.value.url.toString() == ''
                        ? IMAGE_URL
                        : controller.authLogic.userModel.value.url.toString(),
                    onTap: () {},
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    top: 0,
                    child: Icon(Icons.camera_alt, color: Colors.white),
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: 'Số điện thoại',
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
                enableSuggestions: true,
                cursorColor: Colors.black,
                minLines: 1,
                maxLines: 1,
                controller: controller.phoneController,
                keyboardType: TextInputType.number,
                scrollPhysics: const BouncingScrollPhysics(),
              ),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextFormField(
                controller: controller.departmentController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: 'Toà',
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
                enableSuggestions: true,
                cursorColor: Colors.black,
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.text,
                scrollPhysics: const BouncingScrollPhysics(),
              ),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextFormField(
                controller: controller.positionController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: 'Vị trí',
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
                enableSuggestions: true,
                cursorColor: Colors.black,
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.text,
                scrollPhysics: const BouncingScrollPhysics(),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: BaseButton(
                type: ButtonType.primary,
                elevation: 2,
                onPressed: () => controller.updateProfile(),
                child: Center(
                  child: Text(
                    'Chỉnh sửa tài khoản',
                    style: themeData.textTheme.displayLarge!.copyWith(
                      color: themeData.colorScheme.background,
                    ),
                  ),
                ),
              ),
            ),
            20.verticalSpace,
          ],
        ));
  }
}
