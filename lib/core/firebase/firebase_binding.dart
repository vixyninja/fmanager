import 'package:fmanager/core/firebase/firebase.dart';
import 'package:get/get.dart';

class FirebaseBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<FirebaseMessagingSer>(FirebaseMessagingSer());
  }
}
