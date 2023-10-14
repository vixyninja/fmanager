import 'package:flutter/material.dart';
import 'package:fmanager/core/widgets/loading/loading_logic.dart';
import 'package:get/get.dart';

class LoadingView extends GetView<LoadingLogic> {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: controller.isLoading.value,
        child: const Scaffold(
          body: Stack(
            children: [
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  strokeWidth: 3,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
