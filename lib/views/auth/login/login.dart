import 'package:flutter/material.dart';
import 'package:fmanager/controllers/theme_controller.dart';
import 'package:fmanager/core/core.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ThemeController themeController = Get.find<ThemeController>();
  String _selectedLang = Languages.locale.languageCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<ThemeController>(
              builder: (controller) {
                return DropdownButton<String>(
                  value: controller.theme,
                  onChanged: (String? newValue) {
                    controller.setThemeState(newValue!);
                  },
                  items: <String>['system', 'light', 'dark'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
              },
            ),
            DropdownButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              value: _selectedLang,
              items: _buildDropdownMenuItems(),
              onChanged: (String? value) {
                setState(() => _selectedLang = value!);
                Languages.changeLocale(value!);
              },
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    List<DropdownMenuItem<String>> list = [];
    Languages.langs.forEach((key, value) {
      list.add(DropdownMenuItem<String>(
        value: key,
        child: Text(value),
      ));
    });
    return list;
  }
}
