import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthLogic>(AuthLogic());
  }
}
