import 'package:flutter/material.dart';
import 'package:fmanager/views/manager/setting/setting/manager_setting_logic.dart';
import 'package:get/get.dart';

class ManagerSettingView extends GetView<ManagerSettingLogic> {
  const ManagerSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ManagerSettingView')),
    );
  }
}
