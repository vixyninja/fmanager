import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/models/models.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:get/get.dart';

class ProfileUpdateLogic extends BaseController {
  late final AuthLogic authLogic;
  late final FirebaseMessagingSer firebaseMessagingSer;
  late final TextEditingController phoneController;
  late final TextEditingController positionController;
  late final TextEditingController departmentController;

  @override
  void onInit() {
    super.onInit();
    authLogic = Get.find<AuthLogic>();
    firebaseMessagingSer = Get.find<FirebaseMessagingSer>();
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
    await authLogic.updateMyProfile(updateProfileModel).whenComplete(() {
      firebaseMessagingSer.pushNotification(
        title: 'Thông báo',
        body: 'Thông tin cá nhân của bạn đã được cập nhật',
        bigText: 'Thông tin cá nhân của bạn đã được cập nhật',
        id: 2003,
        payload: 'Thông tin cá nhân của bạn đã được cập nhật',
        showBigPicture: false,
        actions: [
          const AndroidNotificationAction(
            'cancel',
            'Đóng',
            cancelNotification: true,
            showsUserInterface: true,
          ),
        ],
      );
      Get.back();
    });
  }
}
