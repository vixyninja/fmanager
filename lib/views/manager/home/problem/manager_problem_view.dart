import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/core/theme/light_color.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:fmanager/views/manager/home/problem/manager_problem_logic.dart';
import 'package:fmanager/views/manager/home/problem/widgets/problem_card.dart';
import 'package:get/get.dart';

class ManagerProblemView extends GetView<ManagerProblemLogic> {
  ManagerProblemView({Key? key}) : super(key: key);

  final ManagerProblemLogic _managerProblemLogic = Get.find<ManagerProblemLogic>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: themeData.colorScheme.background,
        ),
        child: _buildBody(context),
      ),
      backgroundColor: LightColors.managerColor,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: _buildLeadingAppBar(context),
      actions: _buildActionsAppBar(context),
      backgroundColor: LightColors.managerColor,
      surfaceTintColor: Colors.transparent,
    );
  }

  Widget _buildLeadingAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildActionsAppBar(BuildContext context) {
    return <Widget>[
      InkWell(
        onTap: () => Get.defaultDialog(),
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: SvgPicture.asset(
            AssetManager.getIconPath(IconManager.icNotification),
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.background, BlendMode.srcIn),
          ),
        ),
      ),
      const SizedBox(width: 20)
    ];
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () => _managerProblemLogic.onUnactiveType(),
                child: Obx(
                  () => Text(
                    'Sự cố hiện có',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _managerProblemLogic.type.value == 'unActive'
                          ? Colors.orange
                          : Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => _managerProblemLogic.onActiveType(),
                child: Obx(
                  () => Text(
                    'Đang tiếp nhận',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _managerProblemLogic.type.value == 'active'
                          ? Colors.orange
                          : Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ],
          ),
          pinned: true,
          floating: false,
          snap: false,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 24),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Obx(
                    () => ProblemCard(type: _managerProblemLogic.type.value),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ),
      ],
    );
  }
}
