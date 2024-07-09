import 'package:fmanager/core/core.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:get/get.dart';

class TeacherHomeLogic extends BaseController {
  final AuthLogic authLogic = Get.find<AuthLogic>();

  navigateToRequestProblem() {
    Get.toNamed(RouteKeys.teacherReportProblemScreen);
  }

  navigateToRequestSupport() {
    Get.toNamed(RouteKeys.teacherReportProblemScreen);
  }

  navigateToListNotification() {
    Get.toNamed(RouteKeys.notificationScreen);
  }
}
