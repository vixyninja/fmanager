import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmanager/core/loading/bloc/loading_bloc.dart';

class Loading extends StatefulWidget {
  const Loading({super.key, required this.child});

  final Widget? child;

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    final loadingBloc = context.read<LoadingBloc>();
    final ThemeData theme = Theme.of(context);
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (BuildContext context, LoadingState state) {
        return Stack(
          children: [
            widget.child!,
            if (state.isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: theme.primaryColor,
                  ),
                ),
              ),
          ],
        );
      },
      bloc: loadingBloc,
      buildWhen: (LoadingState previous, LoadingState current) => previous.isLoading != current.isLoading,
    );
  }
}
