import 'package:flutter/material.dart';
import 'package:fmanager/core/routes/key.dart';
import 'package:fmanager/core/widgets/error_boundary/error_boundary.dart';
import 'package:fmanager/views/authentication/auth_view.dart';
import 'package:fmanager/views/manager/manager_bottom.dart';
import 'package:fmanager/views/teacher/teacher_bottom.dart';
import 'package:get/get.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (RouteSettings setting) {
  switch (setting.name) {
    case RouteKeys.teacherBottom:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.teacherBottom,
        page: () => const TeacherBottomNavigation(),
      );
    case RouteKeys.managerBottom:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.managerBottom,
        page: () => const ManagerBottomNavigation(),
      );
    case RouteKeys.authScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.authScreen,
        page: () => const AuthView(),
      );
    default:
      return GetPageRoute(settings: setting, page: () => const ErrorBoundary());
  }
};
