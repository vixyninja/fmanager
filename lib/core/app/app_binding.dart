import 'package:fmanager/core/theme/them_logic.dart';
import 'package:fmanager/data/agent.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoadingLogic>(LoadingLogic(), permanent: true);
    Get.put<ApiServices>(ApiServices(), permanent: true);
    Get.put<ThemeLogic>(ThemeLogic(), permanent: true);
  }
}
