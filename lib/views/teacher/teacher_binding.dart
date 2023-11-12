import 'package:fmanager/data/data.dart';
import 'package:fmanager/views/shared/shared.dart';
import 'package:fmanager/views/teacher/history/history/teacher_history_logic.dart';
import 'package:fmanager/views/teacher/history/problem_request/problem_request_logic.dart';
import 'package:fmanager/views/teacher/home/home/teacher_home_logic.dart';
import 'package:fmanager/views/teacher/home/report_problem/report_problem_logic.dart';
import 'package:fmanager/views/teacher/setting/setting/teacher_setting_logic.dart';
import 'package:get/get.dart';

class TeacherBinding extends Bindings {
  @override
  void dependencies() {
    // BOTTOM NAVIGATION BINDING
    Get.lazyPut<TeacherHomeLogic>(() => TeacherHomeLogic(), fenix: true);
    Get.lazyPut<TeacherHistoryLogic>(() => TeacherHistoryLogic(), fenix: true);
    Get.lazyPut<TeacherSettingLogic>(() => TeacherSettingLogic(), fenix: true);

    Get.lazyPut<ProblemRequestLogic>(() => ProblemRequestLogic(), fenix: true);
    Get.lazyPut<ReportProblemLogic>(() => ReportProblemLogic(), fenix: true);
    Get.lazyPut<ListNotificationLogic>(() => ListNotificationLogic(), fenix: true);

    // REPOSITORY BINDING
    Get.lazyPut<FeedBackRepository>(() => FeedbackRepositoryImpl(apiServices: Get.find<ApiServices>()), fenix: true);
  }
}
