import 'package:flutter/material.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthLogic> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthLogic controller = Get.put<AuthLogic>(AuthLogic());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                print('ASDASDASDASDAS ');

                await controller.signInWithGoogle();
              },
              child: const Text('Sign In Google'),
            ),
          ],
        ),
      ),
    );
  }
}
