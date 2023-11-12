import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/models/models.dart';
import 'package:fmanager/views/manager/history/history/manager_history_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class ManagerHistoryView extends GetView<ManagerHistoryLogic> {
  const ManagerHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                  color: themeData.colorScheme.background,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    27.verticalSpace,
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: 10.r, left: 16.r, right: 16.r),
                          child: ProblemItem(
                            feedBackModel: FeedBackModel(
                              id: 0,
                              description: 'Su co ve co so',
                              nameFeedback: 'nguoi khoi tao',
                              url: ['asdfsad'],
                              category: CategoryModel(
                                  categoryName: 'name',
                                  categoryType: 'type',
                                  createdAt: '19-02-2023',
                                  deletedAt: '19-03-2023',
                                  updatedAt: '19-02-2023',
                                  id: 0),
                              room: RoomModel(
                                  building: 'building',
                                  createdAt: '19-02-2023',
                                  floor: 1,
                                  id: 0,
                                  roomName: 'room 1012',
                                  status: 0,
                                  updatedAt: '19-02-2023',
                                  deletedAt: '19-02-2023'),
                              user: UserModel(
                                  createdAt: '19-02-2023',
                                  department: 'depart ment',
                                  email: 'email@gamil.com',
                                  id: 0,
                                  name: 'name',
                                  phoneNumber: '00000000',
                                  position: 'giang vien',
                                  role: RoleEnum.STAFF,
                                  updatedAt: '19-02-2023',
                                  url: 'fsdjkalfja',
                                  deletedAt: '19-02-2023'),
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                    27.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
