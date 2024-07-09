import 'package:fmanager/core/core.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:get/get.dart';

class ManagerSettingLogic extends BaseController {
  RxBool onNotification = false.obs;
  final AuthLogic authLogic = Get.find<AuthLogic>();

  void changeNotification(bool value) {
    onNotification.value = value;
  }

  void navigateToProfileUpdate() {
    Get.toNamed(RouteKeys.updateProfileScreen);
  }
}
