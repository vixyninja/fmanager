import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeLogic extends GetxController {
  final GetStorage storage = GetStorage();

  var theme = 'system';

  @override
  void onInit() {
    super.onInit();
    // setThemeState('light');
    getThemeState();
  }

  void getThemeState() {
    if (storage.read('theme') != null) {
      return setThemeState(storage.read('theme'));
    }
    setThemeState('system');
  }

  void setThemeState(String value) {
    theme = value;
    storage.write('theme', value);

    switch (value) {
      case 'light':
        Get.changeThemeMode(ThemeMode.light);
        break;
      case 'dark':
        Get.changeThemeMode(ThemeMode.dark);
        break;
      case 'system':
        Get.changeThemeMode(ThemeMode.system);
        break;
      default:
        Get.changeThemeMode(ThemeMode.system);
        break;
    }
    update();
  }
}
