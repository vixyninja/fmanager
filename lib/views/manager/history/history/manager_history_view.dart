import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/core/theme/light_color.dart';
import 'package:fmanager/models/models.dart';
import 'package:fmanager/views/manager/history/history/manager_history_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class ManagerHistoryView extends GetView<ManagerHistoryLogic> {
  ManagerHistoryView({Key? key}) : super(key: key);

  @override
  final ManagerHistoryLogic controller = Get.find<ManagerHistoryLogic>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: LightColors.managerColor,
      body: Container(
        margin: EdgeInsets.only(top: 40.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          color: themeData.colorScheme.background,
        ),
        child: RefreshIndicator(
          onRefresh: () async => Future.delayed(const Duration(seconds: 1), () {}),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              20.verticalSpace,
              Text(
                'Lịch sử tiếp nhận sự cố (0)',
                style: themeData.textTheme.displayLarge!.copyWith(
                  color: themeData.colorScheme.onBackground,
                  fontSize: 20.sp,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 16.r, right: 16.r, top: 8.r),
                      child: ProblemItem(
                        feedBackModel: FeedBackModel.createEmpty(),
                      ),
                    );
                  },
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
