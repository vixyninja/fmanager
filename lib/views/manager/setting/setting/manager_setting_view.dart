import 'package:flutter/material.dart';
import 'package:fmanager/views/manager/setting/setting/manager_setting_logic.dart';
import 'package:fmanager/views/manager/setting/setting/utils/constatns.dart';
import 'package:fmanager/views/manager/setting/setting/widgets/card_bottom.dart';
import 'package:get/get.dart';

class ManagerSettingView extends GetView<ManagerSettingLogic> {
  const ManagerSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
          ),
          child: Column(
            children: <Widget>[
              _buildTopContent(theme),
              _buildBottomContent(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopContent(ThemeData theme) {
    return Flexible(
      flex: 3,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(bottom: 48),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 80,
              height: 80,
              child: CircleAvatar(
                radius: 999,
                backgroundImage: NetworkImage(
                  user['image'],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              user['name'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.surface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              user['phone'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomContent(ThemeData theme) {
    return Flexible(
      flex: 4,
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
        child: Column(
          children: <Widget>[
            Wrap(
              children: List.generate(
                optionsSetting.length,
                (index) => Container(
                  padding: const EdgeInsets.only(top: 32),
                  child: CardBottom(
                    theme: theme,
                    title: optionsSetting[index]['title'],
                    iconPath: optionsSetting[index]['iconPath'],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
