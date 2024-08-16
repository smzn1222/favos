import 'package:favos/src/app/favos_app.dart';
import 'package:favos/src/common/widget/footer.dart';
import 'package:favos/src/common/widget/header.dart';
import 'package:favos/src/common/widget/sub_menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<FavosAppState>(context);

    final l10n = L10n.of(context);

    final menuList = [l10n.shop_list, l10n.share, l10n.settings];
    final routeList = ['/shop_list', '/share_menu', '/settings'];
    final iconList = [Icons.playlist_add_check, Icons.share, Icons.settings];
    final subMenuList = [
      l10n.shop_list,
      l10n.shop_list_add,
      l10n.manage_areas,
      l10n.manage_categories,
      l10n.manage_situations,
      l10n.manage_tags,
      l10n.deleted_list,
    ];
    final subRouteList = [
      '/shop_list',
      '/add',
      '/areas',
      '/categories',
      '/situations',
      '/tags',
      '/deleted_list',
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
      drawer: SubMenuDrawer(
          title: l10n.title,
          currentPath: routeList[thisMenuIndex],
          subMenuList: subMenuList,
          subRouteList: subRouteList),
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
