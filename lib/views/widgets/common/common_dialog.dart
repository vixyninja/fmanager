import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDialog {
  static void showDefault(String title, String message, Function() onPressed) {
    Get.dialog(
      AlertDialog(
        title: Text(title, style: DefaultTextStyle.of(Get.context!).style.copyWith(fontWeight: FontWeight.bold)),
        content: Text(message, style: DefaultTextStyle.of(Get.context!).style.copyWith(fontWeight: FontWeight.normal)),
        actions: [
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
