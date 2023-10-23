import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:fmanager/views/teacher/home/home/teacher_home_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class TeacherHomeView extends GetView<TeacherHomeLogic> {
  TeacherHomeView({Key? key}) : super(key: key);

  final TeacherHomeLogic teacherLogic = Get.find<TeacherHomeLogic>();
  final AuthLogic authLogic = Get.find<AuthLogic>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.orange,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 112.h, bottom: 16.h),
              child: BaseHeader(
                onTapAvatarIcon: () => Get.snackbar('Avatar', 'Avatar'),
                onTapSuffixIcon: () => controller.navigateToListNotification(),
                onTapTitle: () => Get.snackbar('Title', 'Title'),
                pathSuffixIcon: AssetManager.getIconPath(IconManager.icBell),
                title: 'Huỳnh Hồng Vỹ',
                colorTitle: themeData.colorScheme.onPrimary,
                colorSuffixIcon: themeData.colorScheme.onPrimary,
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
                      27.verticalSpace,
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
                          title: 'Báo cáo sự cố',
                          onPressed: () => controller.navigateToRequestProblem(),
                        ),
                      ),
                      20.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: FeatureButton(
                          leading: SvgPicture.asset(AssetManager.getIconPath(IconManager.icEarth)),
                          title: 'Yêu cầu hỗ trợ CNTT',
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
