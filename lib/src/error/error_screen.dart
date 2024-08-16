import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Error! Please restart the app.'),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go('/');
          },
          child: Text('HOME'),
        ),
      ]),
    );
  }
}
