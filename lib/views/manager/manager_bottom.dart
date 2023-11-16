import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/core/theme/light_color.dart';
import 'package:fmanager/views/manager/function.dart';
import 'package:fmanager/views/manager/manager_controller.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class ManagerBottomNavigation extends GetView<ManagerController> {
  const ManagerBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Get.put<ManagerController>(ManagerController());
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: LightColors.managerColor),
          toolbarHeight: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            for (final screen in managerBottomNavigation)
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  screen['icon'] as String,
                ),
                activeIcon: SvgPicture.asset(
                  screen['icon'] as String,
                  colorFilter: ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
                ),
                tooltip: screen['label'] as String,
                backgroundColor: theme.colorScheme.background,
                label: screen['label'] as String,
              ),
          ],
          currentIndex: controller.currentIndex.value,
          onTap: (int index) => controller.navigateTo(index),
          type: BottomNavigationBarType.shifting,
          selectedLabelStyle: TextStyle(
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          selectedItemColor: theme.colorScheme.primary,
          selectedFontSize: 12,
        ),
        body: LazyIndexStack(
          index: controller.currentIndex.value,
          alignment: Alignment.bottomCenter,
          sizing: StackFit.expand,
          unloadWidget: const SizedBox.shrink(),
          textDirection: TextDirection.ltr,
          children: managerBottomNavigation.map((screen) => screen['screen'] as Widget).toList(),
        ),
      ),
    );
  }
}
