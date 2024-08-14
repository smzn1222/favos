import 'package:favos/src/common_widget/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Areas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Areas',
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => GoRouter.of(context).pop()),
      ),
      body: Center(
        child: Placeholder(),
      ),
    );
  }
}
