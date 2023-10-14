import 'package:flutter/material.dart';
import 'package:fmanager/views/teacher/setting/setting/teacher_setting_logic.dart';
import 'package:get/get.dart';

class TeacherSettingView extends GetView<TeacherSettingLogic> {
  TeacherSettingView({Key? key}) : super(key: key);

  final TeacherSettingLogic teacherLogic = Get.find<TeacherSettingLogic>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('TeacherSettingView')),
    );
  }
}
