import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/views/shared/shared.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class ListNotificationView extends GetView<ListNotificationLogic> {
  ListNotificationView({super.key});

  @override
  final ListNotificationLogic controller = Get.find<ListNotificationLogic>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Thông báo',
          style: themeData.textTheme.displayLarge!.copyWith(color: themeData.colorScheme.onBackground, fontSize: 20.sp),
        ),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: themeData.colorScheme.onBackground),
          onPressed: () => Navigator.pop(context),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: themeData.colorScheme.background,
      ),
      body: RefreshIndicator(
        onRefresh: () async => Future.delayed(const Duration(milliseconds: 300)),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 10.r, left: 16.r, right: 16.r),
              child: const ItemNotification(
                  title: 'Thông báo về việc nộp hồ sơ xét tuyển đại học, cao đẳng năm 2021',
                  subTitle: 'Mai Hoang Duc Khai'),
            );
          },
          itemCount: 10,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
