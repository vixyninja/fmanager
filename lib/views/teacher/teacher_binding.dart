import 'package:fmanager/data/data.dart';
import 'package:fmanager/views/teacher/history/history/teacher_history_logic.dart';
import 'package:fmanager/views/teacher/home/home/teacher_home_logic.dart';
import 'package:fmanager/views/teacher/setting/setting/teacher_setting_logic.dart';
import 'package:get/get.dart';

class TeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherHomeLogic>(() => TeacherHomeLogic());
    Get.lazyPut<TeacherHistoryLogic>(() => TeacherHistoryLogic());
    Get.lazyPut<TeacherSettingLogic>(() => TeacherSettingLogic());

    Get.lazyPut<RoomRepository>(() => RoomRepositoryImpl(apiServices: Get.find<ApiServices>()));
    Get.lazyPut<CategoryRepository>(() => CategoryRepositoryImpl(apiServices: Get.find<ApiServices>()));
  }
}
