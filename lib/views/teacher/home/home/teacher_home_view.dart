import 'package:flutter/material.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:fmanager/views/teacher/home/home/teacher_home_logic.dart';
import 'package:get/get.dart';

class TeacherHomeView extends GetView<TeacherHomeLogic> {
  TeacherHomeView({Key? key}) : super(key: key);

  final TeacherHomeLogic teacherLogic = Get.find<TeacherHomeLogic>();
  final AuthLogic authLogic = Get.find<AuthLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('TeacherHomeView'),
            ElevatedButton(
              onPressed: () async {
                await authLogic.signOutGoogle();
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
