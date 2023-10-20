import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportProblemLogic extends GetxController {
  late final TextEditingController roomController;
  late final TextEditingController problemController;
  late final TextEditingController descriptionController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    roomController = TextEditingController();
    problemController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    roomController.dispose();
    problemController.dispose();
    descriptionController.dispose();
  }
}
