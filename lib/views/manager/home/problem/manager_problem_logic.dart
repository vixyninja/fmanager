import 'package:get/get.dart';

class ManagerProblemLogic extends GetxController {
  RxString type = RxString('unActive');

  void onUnactiveType() => type.value = 'unActive';
  void onActiveType() => type.value = 'active';
}
