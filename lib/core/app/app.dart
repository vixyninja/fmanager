import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/core/theme/them.dart';
import 'package:fmanager/core/theme/them_logic.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      ensureScreenSize: true,
      splitScreenMode: false,
      child: GestureDetector(
        onTap: () => KeyBoardManager.hideKeyboard(context),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FManager',
          darkTheme: themeDataDark,
          theme: themeData,
          scrollBehavior:
              const MaterialScrollBehavior().copyWith(scrollbars: false, physics: const BouncingScrollPhysics()),
          themeMode: getThemeMode(Get.find<ThemeLogic>().theme),
          onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
              settings: settings, builder: (BuildContext context) => const Scaffold(body: ErrorBoundary())),
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
            return LoadingView(child: child);
          },
          onGenerateRoute: onGenerateRoute,
          initialRoute: RouteKeys.authScreen,
          transitionDuration: const Duration(milliseconds: 300),
          defaultTransition: Transition.topLevel,
          onInit: () {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Get.find<ThemeLogic>().theme == 'dark' ? Colors.black : Colors.white,
              statusBarBrightness: Get.find<ThemeLogic>().theme == 'dark' ? Brightness.light : Brightness.dark,
              statusBarIconBrightness: Get.find<ThemeLogic>().theme == 'dark' ? Brightness.light : Brightness.dark,
              systemNavigationBarColor: Get.find<ThemeLogic>().theme == 'dark' ? Colors.black : Colors.white,
              systemNavigationBarIconBrightness:
                  Get.find<ThemeLogic>().theme == 'dark' ? Brightness.light : Brightness.dark,
            ));
          },
        ),
      ),
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
