import 'package:favos/src/app/favos_app.dart';
import 'package:favos/src/common/footer.dart';
import 'package:favos/src/common/header.dart';
import 'package:favos/src/common/sub_menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<FavosAppState>(context);

    final menuList = ['お店リスト', '共有', '設定'];
    final routeList = ['/shop_list', '/share_menu', '/settings'];
    final iconList = [Icons.playlist_add_check, Icons.share, Icons.settings];
    final subMenuList = [
      'お店リスト',
      'お店追加',
      'エリア管理',
      'カテゴリ管理',
      'シチュエーション管理',
      'タグ管理',
      '削除した項目'
    ];

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
      drawer: SubMenuDrawer(subMenuList: subMenuList),
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
