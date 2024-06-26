import 'package:favos/src/app/favos_app.dart';
import 'package:favos/src/common/footer.dart';
import 'package:favos/src/common/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<FavosAppState>(context);

    final menuList = ['お店リスト', '共有', '設定'];
    final iconList = [Icons.playlist_add_check, Icons.share, Icons.settings];
    final routeList = ['/shop_list', '/share_menu', '/settings'];
    const thisMenuIndex = 2;

    return Scaffold(
      appBar: Header(
        title: menuList[thisMenuIndex],
      ),
      body: Center(
        child: Text(
            'Settings. Index of current location : ${appState.currentLocationIndex}'),
      ),
      bottomNavigationBar: Footer(
        menuList: menuList,
        iconList: iconList,
        routeList: routeList,
        currentMenuIndex: thisMenuIndex,
      ),
    );
  }
}
