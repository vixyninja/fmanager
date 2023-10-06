import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(const LoadingState()) {
    on<LoadingShow>(onLoadingShowEvent);
    on<LoadingHide>(onLoadingHideEvent);
  }

  FutureOr<void> onLoadingShowEvent(LoadingShow event, Emitter<LoadingState> emit) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isLoading: false));
  }

  FutureOr<void> onLoadingHideEvent(LoadingHide event, Emitter<LoadingState> emit) async {
    emit(state.copyWith(isLoading: false));
  }
}
