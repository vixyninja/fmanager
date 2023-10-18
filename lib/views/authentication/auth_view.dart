import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:fmanager/views/authentication/function.dart';
import 'package:fmanager/views/common/common_alert.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthLogic> {
  AuthView({Key? key}) : super(key: key);

  final AuthLogic authLogic = Get.find<AuthLogic>();

  Widget _buildItemPlace(BuildContext context, Map<String, String> item) {
    final ThemeData themeData = Theme.of(context);

    return Obx(
      () => Material(
        color: item['id'] == authLogic.place.value['id']
            ? themeData.colorScheme.secondary
            : themeData.colorScheme.onSecondary,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        child: InkWell(
          onTap: () {
            if (item['id'] == authLogic.place.value['id']) {
              authLogic.place.value = {'id': '', 'name': ''};
            } else {
              authLogic.place.value = item;
            }
          },
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item['name'] ?? '',
                    style: themeData.textTheme.displayMedium!.copyWith(
                      color:
                          item['id'] == authLogic.place.value['id'] ? Colors.white : themeData.colorScheme.onBackground,
                    )),
                Divider(
                  color: item['id'] == authLogic.place.value['id'] ? Colors.white : Colors.grey,
                  height: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bottomSelectPlace(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    CommonAlert.showCustom(
      Center(
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
            color: themeData.colorScheme.onSecondary,
          ),
          margin: EdgeInsets.all(32.r),
          child: Container(
            margin: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Vui lòng chọn cơ sở',
                    style: themeData.textTheme.displayLarge!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    )),
                4.verticalSpace,
                for (var item in staticPlace) _buildItemPlace(context, item),
                4.verticalSpace,
                ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(50, 87, 198, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 42.w),
                      visualDensity: VisualDensity.compact,
                    ),
                    child: Text('Xác nhận', style: themeData.textTheme.displayLarge!.copyWith(color: Colors.white))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.onSecondary,
      body: RefreshIndicator(
        onRefresh: () async {
          Future.delayed(const Duration(seconds: 1), () {});
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: themeData.colorScheme.secondary,
              automaticallyImplyLeading: false,
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox(),
              ),
            ),
            SliverFillViewport(
              delegate: SliverChildListDelegate(
                [
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24.r),
                            bottomRight: Radius.circular(24.r),
                          ),
                          color: themeData.colorScheme.secondary,
                        ),
                      ),
                      Center(
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(24.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 37.w),
                            height: 500.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(24.r)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 60.h),
                                  child: Image.asset(
                                    AssetManager.getImagePath(ImageManager.imgLogo),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Obx(
                                        () => ElevatedButton(
                                          onPressed: () => bottomSelectPlace(context),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey.shade200,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.r),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.h,
                                                horizontal:
                                                    controller.place.value['name']!.compareTo('') == 0 ? 42.w : 16.w),
                                            visualDensity: VisualDensity.compact,
                                          ),
                                          child: Text(
                                            controller.place.value['name']!.compareTo('') == 0
                                                ? 'Chọn cơ sở'
                                                : controller.place.value['name'] ?? '',
                                            style: const TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      32.verticalSpace,
                                      ElevatedButton(
                                        onPressed: () => controller.signInWithGoogle(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(50, 87, 198, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.r),
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 42.w),
                                          visualDensity: VisualDensity.compact,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              AssetManager.getImagePath(ImageManager.imgGoogle),
                                              height: 24.h,
                                              width: 24.w,
                                            ),
                                            8.horizontalSpace,
                                            Text(
                                              'Google',
                                              style: themeData.textTheme.displayLarge!.copyWith(color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        ),
      ),
    );
  }
}
