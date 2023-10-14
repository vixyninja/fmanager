import 'package:flutter/material.dart';
import 'package:fmanager/views/manager/history/history/manager_history_logic.dart';
import 'package:get/get.dart';

class ManagerHistoryView extends GetView<ManagerHistoryLogic> {
  const ManagerHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ManagerHistoryView')),
    );
  }
}
