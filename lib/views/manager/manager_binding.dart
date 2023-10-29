import 'package:fmanager/views/manager/history/history/manager_history_logic.dart';
import 'package:fmanager/views/manager/home/home/manager_home_logic.dart';
import 'package:fmanager/views/manager/setting/setting/manager_setting_logic.dart';
import 'package:get/get.dart';

class ManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagerHomeLogic>(() => ManagerHomeLogic(), fenix: true);
    Get.lazyPut<ManagerHistoryLogic>(() => ManagerHistoryLogic(), fenix: true);
    Get.lazyPut<ManagerSettingLogic>(() => ManagerSettingLogic(), fenix: true);
  }
}
