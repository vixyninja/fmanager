import 'package:fmanager/core/core.dart';
import 'package:get/get.dart';

class TeacherSettingLogic extends BaseController {
  RxBool onNotification = false.obs;

  void changeNotification(bool value) {
    onNotification.value = value;
  }

  void navigateToProfileUpdate() {
    Get.toNamed(RouteKeys.teacherUpdateProfile);
  }
}
