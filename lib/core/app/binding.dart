import 'package:fmanager/core/theme/them_logic.dart';
import 'package:fmanager/core/widgets/widget.dart';
import 'package:fmanager/data/agent.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeLogic>(() => ThemeLogic());
    Get.lazyPut<LoadingLogic>(() => LoadingLogic());
    Get.lazyPut<ApiServices>(() => ApiServices());
  }
}
