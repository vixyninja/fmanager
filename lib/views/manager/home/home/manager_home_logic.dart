import 'package:fmanager/core/core.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:get/get.dart';

class ManagerHomeLogic extends BaseController {
  final AuthLogic authLogic = Get.find<AuthLogic>();

  void navigateToNotification() {
    Get.toNamed(RouteKeys.notificationScreen);
  }
}
