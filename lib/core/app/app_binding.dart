import 'package:fmanager/core/theme/them_logic.dart';
import 'package:fmanager/data/agent.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeLogic>(ThemeLogic());
    Get.put<LoadingLogic>(LoadingLogic());
    Get.put<ApiServices>(ApiServices());
  }
}
