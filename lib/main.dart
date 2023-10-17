import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/core/firebase/firebase.dart';
import 'package:fmanager/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

late final FirebaseApp firebaseApp;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseApp = await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  AppBinding().dependencies();
  FirebaseBinding().dependencies();
  await GetStorage.init();
  runApp(const App());

  Get.find<FirebaseMessagingSer>()
      .pushNotification(id: 1, title: 'App is running', body: 'App is running', bigText: 'App is running');
}
