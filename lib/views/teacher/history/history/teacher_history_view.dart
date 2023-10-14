import 'package:flutter/material.dart';
import 'package:fmanager/views/teacher/history/history/teacher_history_logic.dart';
import 'package:get/get.dart';

class TeacherHistoryView extends GetView<TeacherHistoryLogic> {
  const TeacherHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('TeacherHistoryView')),
    );
  }
}
