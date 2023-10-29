import 'package:fmanager/core/core.dart';
import 'package:get/get.dart';

class TeacherController extends BaseController {
  final RxInt currentIndex = 0.obs;

  void navigateTo(int index) {
    currentIndex.value = index;
  }
}
