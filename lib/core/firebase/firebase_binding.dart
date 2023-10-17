import 'package:firebase_core/firebase_core.dart';
import 'package:fmanager/core/firebase/firebase.dart';
import 'package:fmanager/firebase_options.dart';
import 'package:get/get.dart';

class FirebaseBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<FirebaseApp>(await Firebase.initializeApp(options: DefaultFirebaseOptions.android));
    Get.put<FirebaseMessagingSer>(FirebaseMessagingSer());
  }
}
