import 'package:favos/src/app/favos_app.dart';
import 'package:favos/src/footer/footer.dart';
import 'package:favos/src/header/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShareMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<FavosAppState>(context);

    return Scaffold(
      appBar: Header(
          title: '共有',
          isMenuButtonVisible: false,
          isSearchButtonVisible: false),
      body: Center(
        child: Text(
            'Share Menu. Index of current location : ${appState.currentLocationIndex}'),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
