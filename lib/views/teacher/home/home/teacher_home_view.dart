import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/core/widgets/widget.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:fmanager/views/teacher/home/home/teacher_home_logic.dart';
import 'package:get/get.dart';

class TeacherHomeView extends GetView<TeacherHomeLogic> {
  TeacherHomeView({Key? key}) : super(key: key);

  final TeacherHomeLogic teacherLogic = Get.find<TeacherHomeLogic>();
  final AuthLogic authLogic = Get.find<AuthLogic>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text('TeacherHomeView'),
              ElevatedButton(
                onPressed: () async {
                  await authLogic.signOutGoogle();
                },
                child: const Text('Logout'),
              ),
              24.verticalSpace,
              ElevatedButton(
                onPressed: () async {
                  teacherLogic.onCallApi();
                },
                child: const Text('Get Todo'),
              ),
              FeatureButton(
                leading: SvgPicture.asset(AssetManager.getIconPath(IconManager.icEdit)),
                title: 'Báo cáo sự cố',
                onPressed: () {},
              ),
              // const BaseHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
