import 'package:flutter/material.dart';

class ErrorBoundary extends StatelessWidget {
  const ErrorBoundary({super.key, this.errorMessage = 'Something went wrong :('});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Center(
        child: Text(
          'Something went wrong :( \n\nPlease try again later. \n$errorMessage',
          style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
