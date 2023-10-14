import 'package:flutter/material.dart';
import 'package:fmanager/core/routes/key.dart';
import 'package:fmanager/views/authentication/auth_view.dart';
import 'package:fmanager/views/main/bottom.dart';
import 'package:get/get.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (RouteSettings setting) {
  switch (setting.name) {
    case RouteKeys.bottomNavigation:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.bottomNavigation,
        page: () => const BottomNavigation(),
      );
    case RouteKeys.loginScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.loginScreen,
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 300),
        page: () => const AuthView(),
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
      );
  }
};
