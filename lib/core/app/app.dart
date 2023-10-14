import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/core/theme/them.dart';
import 'package:fmanager/core/theme/them_logic.dart';
import 'package:fmanager/core/widgets/error_boundary/error_boundary.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ThemeLogic themeController = Get.put(ThemeLogic());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FManager',
      darkTheme: themeDataDark,
      theme: themeData,
      scrollBehavior:
          const MaterialScrollBehavior().copyWith(scrollbars: false, physics: const BouncingScrollPhysics()),
      themeMode: getThemeMode(themeController.theme),
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => Scaffold(
          body: ErrorBoundary(errorMessage: 'Route not found: ${settings.name}'),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        Widget error = const Text('...rendering error...');
        if (widget is Scaffold || widget is BottomNavigationBar) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          bool isDebug = false;
          assert(() {
            isDebug = true;
            return true;
          }());
          if (isDebug) {
            return ErrorWidget(errorDetails.exception);
          }
          return ErrorBoundary(errorMessage: errorDetails.exception.toString());
        };
        return child!;
      },
      onGenerateRoute: onGenerateRoute,
      initialRoute: RouteKeys.loginScreen,
      transitionDuration: const Duration(milliseconds: 300),
      defaultTransition: Transition.fade,
    );
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.system;
        break;
    }
    return themeMode;
  }
}
