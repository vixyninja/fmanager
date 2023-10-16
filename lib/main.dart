import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/firebase_options.dart';
import 'package:get_storage/get_storage.dart';

late FirebaseApp firebaseApp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseApp = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  runApp(const App());
}
