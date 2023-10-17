import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/core/firebase/firebase.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  FirebaseBinding().dependencies();
  await GetStorage.init();
  runApp(const App());

  Get.find<FirebaseMessagingSer>().pushNotification(id: 1, title: 'App is running', body: 'App is running');
}
