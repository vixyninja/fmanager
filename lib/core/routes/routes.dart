import 'package:flutter/material.dart';
import 'package:fmanager/core/routes/key.dart';
import 'package:fmanager/views/authentication/auth_binding.dart';
import 'package:fmanager/views/authentication/auth_view.dart';
import 'package:fmanager/views/manager/manager_binding.dart';
import 'package:fmanager/views/manager/manager_bottom.dart';
import 'package:fmanager/views/teacher/history/problem_request/problem_request_view.dart';
import 'package:fmanager/views/teacher/home/report_problem/report_problem_view.dart';
import 'package:fmanager/views/teacher/teacher_binding.dart';
import 'package:fmanager/views/teacher/teacher_bottom.dart';
import 'package:fmanager/views/widgets/error_boundary/error_boundary.dart';
import 'package:get/get.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (RouteSettings setting) {
  switch (setting.name) {
    case RouteKeys.teacherBottom:
      return GetPageRoute(
          settings: setting,
          routeName: RouteKeys.teacherBottom,
          page: () => const TeacherBottomNavigation(),
          bindings: [
            AuthBinding(),
            TeacherBinding(),
          ]);
    case RouteKeys.managerBottom:
      return GetPageRoute(
          settings: setting,
          routeName: RouteKeys.managerBottom,
          page: () => const ManagerBottomNavigation(),
          bindings: [
            AuthBinding(),
            ManagerBinding(),
          ]);
    case RouteKeys.authScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.authScreen,
        page: () => AuthView(),
        binding: AuthBinding(),
      );
    case RouteKeys.problemRequestScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.problemRequestScreen,
        page: () => ProblemRequestView(),
      );
    case RouteKeys.reportProblemScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.reportProblemScreen,
        page: () => ReportProblemView(),
      );
    default:
      return GetPageRoute(settings: setting, page: () => const ErrorBoundary());
  }
};
