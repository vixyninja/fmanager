import 'package:fmanager/core/core.dart';
import 'package:get/get.dart';

class ManagerProblemLogic extends BaseController {
  RxString type = RxString('unActive');

  void onUnactiveType() => type.value = 'unActive';
  void onActiveType() => type.value = 'active';
}
