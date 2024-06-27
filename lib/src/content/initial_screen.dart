import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key, required this.firstContentPath});
  final String firstContentPath;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, firstContentPath);
    });

    return Center(
      child: Text('Favos App is starting...'),
    );
  }
}
