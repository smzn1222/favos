import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key, required this.firstContentPath});
  final String firstContentPath;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      GoRouter.of(context).go(firstContentPath);
    });

    return Center(
      child: Text('Favos App is starting...'),
    );
  }
}
