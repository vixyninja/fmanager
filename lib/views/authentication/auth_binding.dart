import 'package:fmanager/data/data.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserRepository>(UserRepositoryImpl(apiServices: Get.find<ApiServices>()));
    Get.put<AuthLogic>(AuthLogic());
  }
}
