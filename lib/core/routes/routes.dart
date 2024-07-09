import 'package:flutter/material.dart';
import 'package:fmanager/core/routes/key.dart';
import 'package:fmanager/views/authentication/auth_binding.dart';
import 'package:fmanager/views/authentication/auth_view.dart';
import 'package:fmanager/views/manager/home/problem/manager_problem_view.dart';
import 'package:fmanager/views/manager/home/problem_detail/manager_problem_detail_view.dart';
import 'package:fmanager/views/manager/home/problem_detail_active/manager_problem_detail_active_view.dart';
import 'package:fmanager/views/manager/manager_binding.dart';
import 'package:fmanager/views/manager/manager_bottom.dart';
import 'package:fmanager/views/shared/list_notification/list_notification_view.dart';
import 'package:fmanager/views/shared/profile_update/profile_update_view.dart';
import 'package:fmanager/views/teacher/history/problem_request/problem_request_view.dart';
import 'package:fmanager/views/teacher/home/report_problem/report_problem_view.dart';
import 'package:fmanager/views/teacher/teacher_binding.dart';
import 'package:fmanager/views/teacher/teacher_bottom.dart';
import 'package:fmanager/views/widgets/error_boundary/error_boundary.dart';
import 'package:get/get.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (RouteSettings setting) {
  switch (setting.name) {
    case RouteKeys.authScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.authScreen,
        page: () => const AuthView(),
        binding: AuthBinding(),
      );
    case RouteKeys.teacherBottom:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.teacherBottom,
        page: () => const TeacherBottomNavigation(),
        binding: TeacherBinding(),
      );
    case RouteKeys.managerBottom:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.managerBottom,
        page: () => const ManagerBottomNavigation(),
        binding: ManagerBinding(),
      );

    // teacher
    case RouteKeys.teacherProblemRequestScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.teacherProblemRequestScreen,
        page: () => TeacherProblemRequestView(),
      );
    case RouteKeys.teacherReportProblemScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.teacherReportProblemScreen,
        page: () => TeacherReportProblemView(),
      );

    // manager
    case RouteKeys.managerProblemScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.managerProblemScreen,
        page: () => ManagerProblemView(),
      );
    case RouteKeys.managerProblemDetailScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.managerProblemDetailScreen,
        page: () => const ManagerProblemDetailView(),
      );
    case RouteKeys.managerProblemDetailActiveScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.managerProblemDetailActiveScreen,
        page: () => const ManagerProblemDetailActiveView(),
      );

    // admin

    // shared
    case RouteKeys.notificationScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.notificationScreen,
        page: () => ListNotificationView(),
      );

    case RouteKeys.updateProfileScreen:
      return GetPageRoute(
        settings: setting,
        routeName: RouteKeys.updateProfileScreen,
        page: () => const ProfileUpdateView(),
      );

    default:
      return GetPageRoute(settings: setting, page: () => const ErrorBoundary());
  }
};
