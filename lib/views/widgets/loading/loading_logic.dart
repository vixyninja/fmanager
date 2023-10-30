import 'package:get/get.dart';

class LoadingLogic extends GetxController {
  RxBool isLoading = RxBool(false);
  RxString loadingTitle = RxString('');

  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    loadingTitle.value = '';
    isLoading.value = false;
  }

  void showLoadingWithTitle({required String title}) {
    loadingTitle.value = title;
    isLoading.value = true;
  }
}
