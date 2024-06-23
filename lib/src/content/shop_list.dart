import 'package:favos/src/app/favos_app.dart';
import 'package:favos/src/footer/footer.dart';
import 'package:favos/src/header/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<FavosAppState>(context);

    return Scaffold(
      appBar: Header(
          title: 'お店リスト',
          isMenuButtonVisible: true,
          isSearchButtonVisible: true),
      body: Center(
        child: Text(
            'Shop List. Index of current location : ${appState.currentLocationIndex}'),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
