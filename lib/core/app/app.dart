import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmanager/core/app/bloc/app_bloc.dart';
import 'package:fmanager/core/libs/preferences.dart';
import 'package:fmanager/core/loading/bloc/loading_bloc.dart';
import 'package:fmanager/core/loading/loading.dart';
import 'package:fmanager/core/routes/key.dart';
import 'package:fmanager/core/routes/routes.dart';
import 'package:fmanager/core/theme/them.dart';
import 'package:fmanager/widgets/error_boundary/error_boundary.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
            create: (BuildContext context) => AppBloc(prefs: Preferences.instance)..add(AppStarted())),
        BlocProvider<LoadingBloc>(create: (BuildContext context) => LoadingBloc()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final appBloc = context.read<AppBloc>();
          return BlocBuilder<AppBloc, AppState>(
            bloc: appBloc,
            buildWhen: (previous, current) => previous.isDarkMode != current.isDarkMode,
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'FManager',
                darkTheme: themeDataDark,
                theme: themeData,
                scrollBehavior:
                    const MaterialScrollBehavior().copyWith(scrollbars: false, physics: const BouncingScrollPhysics()),
                themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
                  return Loading(child: child ?? error);
                },
                onGenerateRoute: generateRoute,
                initialRoute: RouteKeys.bottomNavigation,
                themeAnimationCurve: Curves.easeInOut,
                themeAnimationDuration: const Duration(milliseconds: 500),
              );
            },
          );
        },
      ),
    );
  }
}
