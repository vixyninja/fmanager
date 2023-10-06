import 'package:flutter/material.dart';
import 'package:fmanager/core/routes/key.dart';
import 'package:fmanager/views/main/bottom.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  switch (setting.name) {
    case RouteKeys.loginScreen:
      return MaterialPageRoute(builder: (context) => const Placeholder());
    case RouteKeys.bottomNavigation:
      return MaterialPageRoute(builder: (context) => const BottomNavigation());
  }
  return MaterialPageRoute(builder: (context) => const Placeholder());
}
