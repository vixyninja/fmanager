import 'package:flutter/material.dart';
import 'package:fmanager/views/manager/home/home/manager_home_logic.dart';
import 'package:get/get.dart';

class ManagerHomeView extends GetView<ManagerHomeLogic> {
  const ManagerHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ManagerHomeView')),
    );
  }
}
