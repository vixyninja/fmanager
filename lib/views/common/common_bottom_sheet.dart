import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonBottomSheet {
  static void show(Widget child) {
    Get.bottomSheet(
      child,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      elevation: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      enableDrag: true,
      enterBottomSheetDuration: const Duration(milliseconds: 300),
      exitBottomSheetDuration: const Duration(milliseconds: 300),
      isDismissible: true,
    );
  }
}
