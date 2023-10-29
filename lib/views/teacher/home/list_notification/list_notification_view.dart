import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/views/teacher/home/list_notification/list_notification_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class ListNotificationView extends GetView<ListNotificationLogic> {
  const ListNotificationView({super.key});

  @override
  ListNotificationLogic get controller => Get.put(ListNotificationLogic());

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông báo',
          style: themeData.textTheme.displayLarge!.copyWith(color: themeData.colorScheme.background, fontSize: 20.sp),
        ),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: themeData.colorScheme.background),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleTextStyle: themeData.textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 20.sp),
      ),
      body: RefreshIndicator(
        onRefresh: () async => Future.delayed(const Duration(milliseconds: 300)),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 10.r, left: 16.r, right: 16.r),
              child: const ItemNotification(
                  title:
                      'Sua may giat, tiviSua may giat, tiviSua may giat, tiviSua may giat, tiviSua may giat, tivitivitivitivitivitivitivitivitivitivitivitivitivitivitivitivitivitivitivitivis',
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
