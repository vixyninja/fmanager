import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/core/theme/light_color.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/manager/home/home/manager_home_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class ManagerHomeView extends GetView<ManagerHomeLogic> {
  ManagerHomeView({Key? key}) : super(key: key);

  @override
  final ManagerHomeLogic controller = Get.find<ManagerHomeLogic>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: LightColors.managerColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 92.h, bottom: 16.h),
              child: Obx(
                () => BaseHeader(
                  onTapAvatarIcon: () => Get.snackbar('Avatar', 'Avatar'),
                  onTapSuffixIcon: () => controller.navigateToNotification(),
                  onTapTitle: () => Get.snackbar('Title', 'Title'),
                  pathSuffixIcon: AssetManager.getIconPath(IconManager.icBell),
                  title: controller.authLogic.userModel.value.name,
                  colorTitle: themeData.colorScheme.onPrimary,
                  colorSuffixIcon: themeData.colorScheme.onPrimary,
                  urlAvatar: controller.authLogic.userModel.value.url,
                  subtitle: 'Manager',
                  colorSubtitle: themeData.colorScheme.onPrimary.withOpacity(0.8),
                  pathAvatarIcon: IconManager.icManager,
                ),
              ),
            ),
          ),
          SliverFillViewport(
            delegate: SliverChildListDelegate(
              [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                    color: themeData.colorScheme.background,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Text(
                        'Dịch vụ trực tuyến',
                        style: themeData.textTheme.displayLarge!.copyWith(
                          color: themeData.colorScheme.onBackground,
                          fontSize: 20.sp,
                        ),
                      ),
                      24.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: FeatureButton(
                          leading: SvgPicture.asset(AssetManager.getIconPath(IconManager.icEdit)),
                          title: 'Sự cố cần hỗ trợ',
                          onPressed: () => Get.toNamed(RouteKeys.managerProblemScreen),
                        ),
                      ),
                      20.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: FeatureButton(
                          leading: SvgPicture.asset(AssetManager.getIconPath(IconManager.icEarth)),
                          title: 'Tính sẵn sàng phòng học',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      ),
    );
  }
}
