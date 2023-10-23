import 'package:get/get.dart';

class LoadingLogic extends GetxController {
  RxBool isLoading = RxBool(false);

  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    isLoading.value = false;
  }
}
