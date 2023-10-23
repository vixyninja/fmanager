import 'package:flutter/material.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:get/get.dart';

class ThemeLogic extends GetxController {
  var theme = 'light';

  @override
  void onInit() {
    super.onInit();
    getThemeState();
  }

  void getThemeState() {
    if (StorageManager.read(StorageKeys.theme.toString()) != null) {
      return setThemeState(StorageManager.read(StorageKeys.theme.toString()));
    }
    setThemeState('light');
  }

  void setThemeState(String value) {
    theme = value;
    StorageManager.write(StorageKeys.theme.toString(), value);

    switch (value) {
      case 'light':
        Get.changeThemeMode(ThemeMode.light);
        break;
      case 'dark':
        Get.changeThemeMode(ThemeMode.dark);
        break;
      default:
        Get.changeThemeMode(ThemeMode.light);
        break;
    }
    update();
  }
}
