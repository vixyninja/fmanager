import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonAlert {
  static void showCustom(Widget widget) {
    Get.dialog(
      widget,
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierColor: const Color(0x80000000),
    );
  }

  static void showDefault(String title, String content) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 300),
      useSafeArea: true,
      barrierDismissible: true,
      barrierColor: const Color(0x80000000),
    );
  }

  static void showSnackBar(
    String title,
    String content, {
    SnackPosition position = SnackPosition.BOTTOM,
    Icon icon = const Icon(Icons.info_outline, color: Colors.white),
    VoidCallback? onTap,
  }) {
    Get.snackbar(
      title,
      content,
      snackPosition: position,
      backgroundColor: Colors.black.withOpacity(0.3),
      colorText: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
      icon: icon,
      margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInOut,
      isDismissible: true,
    );
  }
}
