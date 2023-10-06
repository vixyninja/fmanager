part of 'loading_bloc.dart';

class LoadingState extends Equatable {
  final bool isLoading;

  const LoadingState({this.isLoading = false});

  LoadingState copyWith({bool? isLoading}) {
    return LoadingState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
