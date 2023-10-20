import 'package:flutter/material.dart';
import 'package:fmanager/views/authentication/auth_logic.dart';
import 'package:fmanager/views/manager/home/home/manager_home_logic.dart';
import 'package:fmanager/views/manager/home/home/utils/constants.dart';
import 'package:fmanager/views/manager/home/home/widgets/card_option.dart';
import 'package:fmanager/views/manager/home/home/widgets/header.dart';
import 'package:get/get.dart';

class ManagerHomeView extends GetView<ManagerHomeLogic> {
  ManagerHomeView({Key? key}) : super(key: key);

  final ManagerHomeLogic managerLogic = Get.find<ManagerHomeLogic>();
  final AuthLogic authLogic = Get.find<AuthLogic>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: theme.colorScheme.secondary),
        child: Column(
          children: <Widget>[
            _buildHeaderContent(theme),
            _buildBottomContent(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderContent(ThemeData theme) {
    return Flexible(
      flex: 2,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Header(theme: theme),
        ),
      ),
    );
  }

  Widget _buildBottomContent(ThemeData theme) {
    return Flexible(
      flex: 6,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 24),
              Text(
                'Dịch vụ trực tuyến',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                children: List.generate(
                  options.length,
                  (index) => Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: CardOption(
                      title: options[index]['title'],
                      iconPath: options[index]['iconPath'],
                      theme: theme,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
