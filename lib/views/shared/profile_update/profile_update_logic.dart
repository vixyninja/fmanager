import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/models/models.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:get/get.dart';

class ProfileUpdateLogic extends BaseController {
  late final AuthLogic authLogic;
  late final TextEditingController phoneController;
  late final TextEditingController positionController;
  late final TextEditingController departmentController;

  @override
  void onInit() {
    super.onInit();
    authLogic = Get.find<AuthLogic>();
    phoneController = TextEditingController(text: authLogic.userModel.value.phoneNumber);
    positionController = TextEditingController(text: authLogic.userModel.value.position);
    departmentController = TextEditingController(text: authLogic.userModel.value.department);
  }

  void updateProfile() async {
    if (phoneController.text.toString().compareTo(authLogic.userModel.value.phoneNumber.toString()) == 0 &&
        positionController.text.toString().compareTo(authLogic.userModel.value.position.toString()) == 0 &&
        departmentController.text.toString().compareTo(authLogic.userModel.value.department.toString()) == 0) {
      Get.back();
      return;
    }

    final updateProfileModel = UpdateProfileModel(
      phoneNumber: phoneController.text,
      position: positionController.text,
      department: departmentController.text,
    );
    await authLogic.updateMyProfile(updateProfileModel);
  }
}
