import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/core/theme/them_logic.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:fmanager/views/teacher/setting/setting/teacher_setting_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class TeacherSettingView extends GetView<TeacherSettingLogic> {
  const TeacherSettingView({Key? key}) : super(key: key);

  @override
  TeacherSettingLogic get controller => Get.find<TeacherSettingLogic>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final AuthLogic authLogic = Get.find<AuthLogic>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        toolbarHeight: kBottomNavigationBarHeight,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          27.verticalSpace,
          Obx(
            () => BaseCircleAvatar(
              width: 80.w,
              height: 80.h,
              onTap: () {},
              imageUrl: authLogic.userModel.value.url.toString(),
            ),
          ),
          7.verticalSpace,
          Obx(
            () => Text(
              authLogic.userModel.value.name.toString(),
              style: themeData.textTheme.displayLarge!.copyWith(
                color: themeData.colorScheme.background,
                fontSize: 20.sp,
              ),
            ),
          ),
          7.verticalSpace,
          Obx(
            () => Text(
              authLogic.userModel.value.phoneNumber == ''
                  ? 'Chưa có số điện thoại'
                  : authLogic.userModel.value.phoneNumber.toString(),
              style: themeData.textTheme.displayMedium!.copyWith(
                color: themeData.colorScheme.background,
                fontSize: 18.sp,
              ),
            ),
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
              padding: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ItemSetting(
                    title: 'Chỉnh sửa tài khoản',
                    onTap: () => controller.navigateToProfileUpdate(),
                    suffixIcon: SvgPicture.asset(AssetManager.getIconPath(IconManager.icUser)),
                    prefixIcon: SvgPicture.asset(AssetManager.getIconPath(IconManager.icNext),
                        colorFilter: ColorFilter.mode(themeData.colorScheme.onBackground, BlendMode.srcIn)),
                  ),
                  20.verticalSpace,
                  ItemSetting(
                      title: 'Tắt thông báo',
                      onTap: () => controller.changeNotification(!controller.onNotification.value),
                      suffixIcon: SvgPicture.asset(AssetManager.getIconPath(IconManager.icNotification)),
                      prefixIcon: Obx(() => BaseSwitch(
                            value: controller.onNotification.value,
                            onChanged: (value) => controller.changeNotification(!value),
                          ))),
                  20.verticalSpace,
                  GetBuilder<ThemeLogic>(
                    builder: (controller) {
                      return ItemSetting(
                        title: 'Giao diện nền',
                        suffixIcon: Icon(Icons.dark_mode_outlined, size: 24.r, color: Colors.black),
                        prefixIcon: BaseSwitch(
                          value: controller.theme == 'dark',
                          onChanged: (value) => controller.setThemeState(!value ? 'dark' : 'light'),
                        ),
                        onTap: () => controller.setThemeState(controller.theme == 'dark' ? 'light' : 'dark'),
                      );
                    },
                  ),
                  20.verticalSpace,
                  GetBuilder<AuthLogic>(
                    init: authLogic,
                    builder: (controller) {
                      return ItemSetting(
                        title: 'Vân tay',
                        onTap: () {
                          controller.enableBiometric = !controller.enableBiometric;
                        },
                        prefixIcon: BaseSwitch(
                            value: controller.enableBiometric,
                            onChanged: (value) => controller.enableBiometric = !value),
                        suffixIcon: Icon(Icons.security_outlined, size: 24.r, color: Colors.black),
                      );
                    },
                  ),
                  20.verticalSpace,
                  ItemSetting(
                    title: 'Đăng xuất',
                    onTap: () => authLogic.signOutGoogle(),
                    suffixIcon: SvgPicture.asset(
                      AssetManager.getIconPath(IconManager.icLogout),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
