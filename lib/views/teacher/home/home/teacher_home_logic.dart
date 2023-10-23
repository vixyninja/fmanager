import 'package:fmanager/core/core.dart';
import 'package:get/get.dart';

class TeacherHomeLogic extends GetxController {
  navigateToRequestProblem() {
    Get.toNamed(RouteKeys.teacherReportProblemScreen);
  }

  navigateToListNotification() {
    Get.toNamed(RouteKeys.teacherNotificationScreen);
  }
}
