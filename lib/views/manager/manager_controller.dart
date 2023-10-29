import 'package:get/get.dart';

class ManagerController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void navigateTo(int index) {
    currentIndex.value = index;
  }
}
