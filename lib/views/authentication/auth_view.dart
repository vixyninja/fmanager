import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthLogic> {
  AuthView({super.key});

  final AuthLogic authController = Get.put<AuthLogic>(AuthLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          // onPressed: () => authController.signInWithGoogle(),
          onPressed: () => {
            Navigator.of(context).pushNamed(RouteKeys.managerBottom),
          },
          child: const Text('Sign In Google'),
        ),
      ),
    );
  }
}
