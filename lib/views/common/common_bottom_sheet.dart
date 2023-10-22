import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonBottomSheet {
  static void show(Widget child, ThemeData theme) {
    Get.bottomSheet(
      child,
      backgroundColor: theme.colorScheme.background,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      elevation: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      enableDrag: true,
      enterBottomSheetDuration: const Duration(milliseconds: 300),
      exitBottomSheetDuration: const Duration(milliseconds: 300),
      isDismissible: true,
    );
  }
}
