import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key, required this.firstContentPath});
  final String firstContentPath;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, widget.firstContentPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favos App is starting...'),
    );
  }
}
