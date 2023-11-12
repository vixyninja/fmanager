import 'package:fmanager/core/core.dart';
import 'package:get/get.dart';

class TeacherHomeLogic extends BaseController {
  navigateToRequestProblem() {
    Get.toNamed(RouteKeys.teacherReportProblemScreen);
  }

  navigateToRequestSupport(){
    Get.toNamed(RouteKeys.teacherReportProblemScreen);
  }

  navigateToListNotification() {
    Get.toNamed(RouteKeys.teacherNotificationScreen);
  }
}
