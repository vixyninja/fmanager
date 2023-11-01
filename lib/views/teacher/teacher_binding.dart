import 'package:fmanager/data/data.dart';
import 'package:fmanager/views/teacher/history/history/teacher_history_logic.dart';
import 'package:fmanager/views/teacher/home/home/teacher_home_logic.dart';
import 'package:fmanager/views/teacher/setting/setting/teacher_setting_logic.dart';
import 'package:get/get.dart';

class TeacherBinding extends Bindings {
  @override
  void dependencies() {
    // BOTTOM NAVIGATION BINDING
    Get.lazyPut<TeacherHomeLogic>(() => TeacherHomeLogic(), fenix: true);
    Get.lazyPut<TeacherHistoryLogic>(() => TeacherHistoryLogic(), fenix: true);
    Get.lazyPut<TeacherSettingLogic>(() => TeacherSettingLogic(), fenix: true);

    Get.lazyPut<FeedBackRepository>(() => FeedbackRepositoryImpl(apiServices: Get.find<ApiServices>()), fenix: true);
  }
}
