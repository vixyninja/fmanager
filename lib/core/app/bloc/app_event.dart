part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {}

class AppStarted extends AppEvent {
  @override
  List<Object?> get props => [];
}

class AppThemeChanged extends AppEvent {
  final bool isDarkMode;

  AppThemeChanged({
    required this.isDarkMode,
  });

  @override
  List<Object?> get props => [isDarkMode];
}
