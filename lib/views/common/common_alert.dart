import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAlert {
  static void showCustom(Widget widget) {
    Get.dialog(
      widget,
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 300),
      useSafeArea: true,
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
}
