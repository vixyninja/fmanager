import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/teacher/history/problem_request/problem_request_logic.dart';
import 'package:fmanager/views/widgets/problem_item/problem_item.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

class ProblemRequestView extends GetView<ProblemRequestLogic> {
  ProblemRequestView({super.key});

  final ProblemRequestLogic logic = Get.put<ProblemRequestLogic>(ProblemRequestLogic());

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.secondary,
      appBar: AppBar(
        title: Text(
          'Yêu cầu sự cố',
          style: themeData.textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 20.sp),
        ),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleTextStyle: themeData.textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 20.sp),
      ),
      body: Container(
        color: themeData.colorScheme.background,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.r),
              child: const ProblemItem(title: 'Sự cố 1', subTitle: 'Nguyen Van A'),
            ),
            20.verticalSpace,
            Text('Trạng thái yêu cầu', style: themeData.textTheme.displayLarge!),
            20.verticalSpace,
            Timeline.tileBuilder(
              shrinkWrap: true,
              builder: TimelineTileBuilder.connected(
                contentsAlign: ContentsAlign.basic,
                oppositeContentsBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('09:00 am'),
                ),
                contentsBuilder: (context, index) => const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Yêu cầu đã được tiếp nhận'),
                  ),
                ),
                nodePositionBuilder: (context, index) => 0.3,
                itemCount: 3,
                indicatorBuilder: (context, index) {
                  return Builder(
                    builder: (context) {
                      final color = index == 0 ? themeData.colorScheme.secondary : themeData.colorScheme.background;
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
                                      )
                                    : SvgPicture.asset(
                                        AssetManager.getIconPath(IconManager.icReset),
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
                                highlightColor: Colors.grey.withOpacity(0.3),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                connectorBuilder: (context, index, type) {
                  return const SolidLineConnector(
                    color: Colors.red,
                    direction: Axis.vertical,
                  );
                },
                connectionDirection: ConnectionDirection.before,
                itemExtentBuilder: (_, __) => 80,
              ),
              physics: const NeverScrollableScrollPhysics(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: themeData.colorScheme.secondary,
                backgroundColor: themeData.colorScheme.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: BorderSide(color: themeData.colorScheme.secondary),
                ),
                minimumSize: Size(double.infinity, 48.h),
                animationDuration: const Duration(milliseconds: 500),
              ),
              child: Text(
                'Phản hồi',
                style: themeData.textTheme.displayLarge!.copyWith(color: themeData.colorScheme.secondary),
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
