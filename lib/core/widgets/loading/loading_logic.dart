import 'package:get/get.dart';

class LoadingLogic extends GetxController {
  final RxBool isLoading = false.obs;

  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    isLoading.value = false;
  }
}
