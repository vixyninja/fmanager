import 'package:flutter/material.dart';
import 'package:fmanager/routes/key.dart';
import 'package:fmanager/views/auth/login/login.dart';
import 'package:fmanager/views/main/bottom.dart';
import 'package:get/get.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (RouteSettings setting) {
  switch (setting.name) {
    case RouteKeys.bottomNavigation:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.bottomNavigation,
        page: () => const BottomNavigation(),
        binding: null,
      );
    case RouteKeys.loginScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.loginScreen,
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 300),
        page: () => const LoginScreen(),
        title: 'Login',
      );
    default:
      return GetPageRoute(
        settings: setting,
        page: () => Scaffold(
          body: Center(
            child: Text('Route not found: ${setting.name}'),
          ),
        ),
        binding: null,
      );
  }
};
