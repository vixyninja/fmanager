import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:fmanager/views/manager/home/problem/manager_problem_logic.dart';
import 'package:fmanager/views/manager/home/problem/widgets/problem_card.dart';
import 'package:get/get.dart';

class ManagerProblemView extends GetView<ManagerProblemLogic> {
  const ManagerProblemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: Colors.white,
        ),
        child: _buildBody(),
      ),
      backgroundColor: Colors.orange,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: _buildLeadingAppBar(context),
      actions: _buildActionsAppBar(),
    );
  }

  Widget _buildLeadingAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        borderRadius: BorderRadius.circular(999),
        child: const Padding(
          padding: EdgeInsets.all(2),
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildActionsAppBar() {
    return <Widget>[
      InkWell(
        onTap: () => Get.defaultDialog(),
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: SvgPicture.asset(
            AssetManager.getIconPath(IconManager.icNotification),
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(width: 20)
    ];
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () => {},
                child: const Text(
                  'Sự cố hiện có',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: const Text(
                  'Đang tiếp nhận',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          floating: true,
          snap: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 24),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: ProblemCard(),
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
