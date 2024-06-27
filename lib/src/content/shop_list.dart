import 'package:favos/src/app/favos_app.dart';
import 'package:favos/src/footer/footer.dart';
import 'package:favos/src/header/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<FavosAppState>(context);

    final menuList = ['お店リスト', '共有', '設定'];
    final iconList = [Icons.playlist_add_check, Icons.share, Icons.settings];
    final routeList = ['/shop_list', '/share_menu', '/settings'];
    const thisMenuIndex = 0;

    var scaffoldKey = GlobalKey<ScaffoldState>();

    final IconButton menuButton = IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => scaffoldKey.currentState!.openDrawer());
    final IconButton searchButton = IconButton(
        icon: Icon(Icons.search),
        onPressed: () => scaffoldKey.currentState!.openEndDrawer());
    final List<Widget> actions = [searchButton];

    return Scaffold(
      key: scaffoldKey,
      appBar: Header(
        title: menuList[thisMenuIndex],
        leading: menuButton,
        actions: actions,
      ),
      drawer: Drawer(),
      endDrawer: Drawer(),
      body: Center(
        child: Text(
            'Shop List. Index of current location : ${appState.currentLocationIndex}'),
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
