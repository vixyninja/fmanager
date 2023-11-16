import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmanager/views/widgets/loading/loading_logic.dart';
import 'package:get/get.dart';

class LoadingView extends GetView<LoadingLogic> {
  final Widget? child;

  const LoadingView({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              child!,
              if (controller.isLoading.value)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CupertinoActivityIndicator(animating: true),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
