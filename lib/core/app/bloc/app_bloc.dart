import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SharedPreferences prefs;

  AppBloc({required this.prefs}) : super(const AppState()) {
    on<AppStarted>(onAppStartedEvent);
    on<AppThemeChanged>(onAppThemeChangedEvent);
  }

  FutureOr<void> onAppStartedEvent(AppStarted event, Emitter<AppState> emit) async {
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  FutureOr<void> onAppThemeChangedEvent(AppThemeChanged event, Emitter<AppState> emit) async {
    emit(state.copyWith(isDarkMode: event.isDarkMode));
    prefs.setBool('isDarkMode', event.isDarkMode);
  }
}
