import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:get/get.dart';

class ThemeLogic extends BaseController {
  var theme = 'light';

  @override
  void onInit() {
    super.onInit();
    getThemeState();
  }

  getThemeState() {
    if (StorageManager.read(StorageKeys.theme.toString()) != null) {
      return setThemeState(StorageManager.read(StorageKeys.theme.toString()));
    }
    setThemeState('light');
  }

  void setThemeState(String value) {
    showLoading();
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
    hideLoading();
  }
}
