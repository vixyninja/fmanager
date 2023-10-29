import 'package:get/get.dart';

class TeacherController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void navigateTo(int index) {
    currentIndex.value = index;
  }
}
