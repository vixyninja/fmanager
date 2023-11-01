import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/core/theme/them_logic.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:fmanager/views/manager/setting/setting/manager_setting_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class ManagerSettingView extends GetView<ManagerSettingLogic> {
  ManagerSettingView({Key? key}) : super(key: key);

  final AuthLogic authLogic = Get.find<AuthLogic>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.orange,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.orange,
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
                  width: 80.w,
                  height: 80.h,
                  onTap: () {},
                ),
                7.verticalSpace,
                Text(
                  'Synx',
                  style: themeData.textTheme.displayLarge!.copyWith(
                    color: themeData.colorScheme.background,
                    fontSize: 20.sp,
                  ),
                ),
                7.verticalSpace,
                Text(
                  '0123456789',
                  style: themeData.textTheme.displayMedium!.copyWith(
                    color: themeData.colorScheme.background,
                    fontSize: 18.sp,
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
                    padding:
                        EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ItemSetting(
                          title: 'Chỉnh sửa tài khoản',
                          onTap: () {},
                          suffixIcon: SvgPicture.asset(
                              AssetManager.getIconPath(IconManager.icUser)),
                          prefixIcon: SvgPicture.asset(
                              AssetManager.getIconPath(IconManager.icNext),
                              colorFilter: ColorFilter.mode(
                                  themeData.colorScheme.onBackground,
                                  BlendMode.srcIn)),
                        ),
                        20.verticalSpace,
                        ItemSetting(
                            title: 'Tắt thông báo',
                            onTap: () => controller.changeNotification(
                                !controller.onNotification.value),
                            suffixIcon: SvgPicture.asset(
                                AssetManager.getIconPath(
                                    IconManager.icNotification)),
                            prefixIcon: Obx(() => BaseSwitch(
                                  value: controller.onNotification.value,
                                  onChanged: (value) =>
                                      controller.changeNotification(!value),
                                ))),
                        20.verticalSpace,
                        GetBuilder<ThemeLogic>(
                          builder: (controller) {
                            return ItemSetting(
                              title: 'Giao diện nền',
                              suffixIcon: SvgPicture.asset(
                                  AssetManager.getIconPath(
                                      IconManager.icNotification)),
                              prefixIcon: BaseSwitch(
                                value: controller.theme == 'dark',
                                onChanged: (value) => controller
                                    .setThemeState(!value ? 'dark' : 'light'),
                              ),
                              onTap: () => controller.setThemeState(
                                  controller.theme == 'dark'
                                      ? 'light'
                                      : 'dark'),
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
          ),
        ],
      ),
    );
  }
}
