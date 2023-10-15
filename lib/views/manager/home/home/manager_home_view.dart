import 'package:flutter/material.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:fmanager/views/manager/home/home/manager_home_logic.dart';
import 'package:get/get.dart';

class ManagerHomeView extends GetView<ManagerHomeLogic> {
  ManagerHomeView({Key? key}) : super(key: key);

  final ManagerHomeLogic managerLogic = Get.find<ManagerHomeLogic>();
  final AuthLogic authLogic = Get.find<AuthLogic>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authLogic.signOutGoogle();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
