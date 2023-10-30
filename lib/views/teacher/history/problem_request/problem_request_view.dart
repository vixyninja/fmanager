import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/teacher/history/problem_request/problem_request_logic.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

class ProblemRequestView extends GetView<ProblemRequestLogic> {
  const ProblemRequestView({super.key});

  @override
  ProblemRequestLogic get controller => Get.put<ProblemRequestLogic>(ProblemRequestLogic());

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.orange,
            toolbarHeight: kBottomNavigationBarHeight,
            title: Text(
              'Thông tin sự cố',
              style: themeData.textTheme.displayLarge!.copyWith(
                color: themeData.colorScheme.background,
                fontSize: 20.sp,
              ),
            ),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios, color: themeData.colorScheme.background),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              color: themeData.colorScheme.background,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 16.r), child: const SizedBox()),
                  20.verticalSpace,
                  Text('Trạng thái yêu cầu', style: themeData.textTheme.displayLarge!),
                  Timeline.tileBuilder(
                    shrinkWrap: true,
                    builder: TimelineTileBuilder.connected(
                      contentsAlign: ContentsAlign.basic,
                      oppositeContentsBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('09:00 am'),
                      ),
                      contentsBuilder: (context, index) => Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: const Text('Yêu cầu đã được tiếp nhận'),
                        ),
                      ),
                      nodePositionBuilder: (context, index) => 0.3,
                      itemCount: 3,
                      indicatorBuilder: (context, index) {
                        return Builder(
                          builder: (context) {
                            final color = index == 0 ? Colors.orange : themeData.colorScheme.tertiary;
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                  child: DotIndicator(
                                    size: 40,
                                    color: color,
                                    child: Center(
                                      child: index == 0
                                          ? SvgPicture.asset(
                                              AssetManager.getIconPath(IconManager.icCheck),
                                              width: 20,
                                              height: 20,
                                            )
                                          : SvgPicture.asset(
                                              AssetManager.getIconPath(IconManager.icReset),
                                              width: 20,
                                              height: 20,
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(99),
                                    child: InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(99),
                                      highlightColor: themeData.colorScheme.tertiary,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      connectorBuilder: (context, index, type) {
                        return SolidLineConnector(
                          color: themeData.colorScheme.tertiary.withOpacity(0.5),
                          direction: Axis.vertical,
                        );
                      },
                      connectionDirection: ConnectionDirection.before,
                      itemExtentBuilder: (_, __) => 80,
                    ),
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: BaseButton(
                      onPressed: () {},
                      type: ButtonType.primary,
                      child: Text(
                        'Phản hồi',
                        style: themeData.textTheme.displayLarge!.copyWith(color: themeData.colorScheme.secondary),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
