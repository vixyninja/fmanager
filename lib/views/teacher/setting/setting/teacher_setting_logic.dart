import 'package:get/get.dart';

class TeacherSettingLogic extends GetxController {
  RxBool onNotification = false.obs;

  void changeNotification(bool value) {
    onNotification.value = value;
  }
}
