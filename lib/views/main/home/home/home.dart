import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmanager/core/app/bloc/app_bloc.dart';
import 'package:fmanager/core/loading/bloc/loading_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text('Home Screen'),
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<AppBloc>().add(AppThemeChanged(isDarkMode: !state.isDarkMode));
                    },
                    child: const Text('Change theme'),
                  );
                },
              ),
              BlocBuilder<LoadingBloc, LoadingState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<LoadingBloc>().add(LoadingShow());
                      },
                      child: const Text('Show loading'));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
