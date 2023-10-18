import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
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

  Get.find<FirebaseMessagingSer>().pushNotification(
      id: 1,
      title: 'App is running',
      body: 'App is running',
      bigText:
          'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt12dbddde5342ce4c/648866ff21a8556da61fa167/GOAL_-_Blank_WEB_-_Facebook_-_2023-06-13T135350.847.png?auto=webp&format=pjpg&width=3840&quality=60',
      showBigPicture: true);
}
