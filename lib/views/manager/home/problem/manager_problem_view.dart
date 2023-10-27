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
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: _buildBody(),
      ),
      backgroundColor: Colors.orange,
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: _buildLeadingAppBar(),
      actions: _buildActionsAppBar(),
    );
  }

  Widget _buildLeadingAppBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () => {},
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
        onTap: () => {},
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
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
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: ProblemCard(),
            ),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
