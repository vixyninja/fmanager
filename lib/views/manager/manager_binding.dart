import 'package:fmanager/views/manager/history/history/manager_history_logic.dart';
import 'package:fmanager/views/manager/home/home/manager_home_logic.dart';
import 'package:fmanager/views/manager/home/problem/manager_problem_logic.dart';
import 'package:fmanager/views/manager/home/problem_detail/manager_problem_detail_logic.dart';
import 'package:fmanager/views/manager/home/problem_detail_active/manager_problem_detail_active_logic.dart';
import 'package:fmanager/views/manager/setting/setting/manager_setting_logic.dart';
import 'package:get/get.dart';

class ManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagerHomeLogic>(() => ManagerHomeLogic(), fenix: true);
    Get.lazyPut<ManagerHistoryLogic>(() => ManagerHistoryLogic(), fenix: true);
    Get.lazyPut<ManagerSettingLogic>(() => ManagerSettingLogic(), fenix: true);
    Get.lazyPut<ManagerProblemLogic>(() => ManagerProblemLogic(), fenix: true);
    Get.lazyPut<ManagerProblemDetailLogic>(() => ManagerProblemDetailLogic(),
        fenix: true);
    Get.lazyPut<ManagerProblemDetailActiveLogic>(
        () => ManagerProblemDetailActiveLogic(),
        fenix: true);
  }
}
