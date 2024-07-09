import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/firebase_options.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:get/get.dart';

late final FirebaseApp firebaseApp;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseApp = await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await StorageManager.init();
  AppBinding().dependencies();
  FirebaseBinding().dependencies();
  runApp(const App());

  Get.find<FirebaseMessagingSer>().pushNotification(
    id: 1,
    title: 'App is running',
    body: 'App is running',
    bigText:
        'https://gaohouse.vn/wp-content/uploads/2023/07/dong-phuc-fpt-polytechnic-dep_6d1dfeb3e70049708529bcb89ada88db_grande.jpeg',
    showBigPicture: true,
  );
}
