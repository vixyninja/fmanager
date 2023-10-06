part of 'loading_bloc.dart';

sealed class LoadingEvent extends Equatable {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}

class LoadingShow extends LoadingEvent {
  @override
  List<Object> get props => [];
}

class LoadingHide extends LoadingEvent {
  @override
  List<Object> get props => [];
}
