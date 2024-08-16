import 'package:favos/src/Entity/shop.dart';
import 'package:favos/src/common/widget/footer.dart';
import 'package:favos/src/common/widget/header.dart';
import 'package:favos/src/common/widget/sub_menu_drawer.dart';
import 'package:favos/src/info/favos_menu_info.dart';
import 'package:favos/src/info/shop_list_sub_menu_info.dart';
import 'package:favos/src/parts/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ShopListScreen extends StatelessWidget {
  ShopListScreen({super.key});
  late final FavosMenuInfo favosMenuInfo;
  late final ShopListSubMenuInfo shopListSubMenuInfo;
  final shopList = List.generate(20,
      (index) => Shop(name: 'Shop$index', url: 'https://example$index.com'));

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final String thisMenuLabel = l10n.shop_list;
    final favosMenuInfo = FavosMenuInfo(context);
    final shopListSubMenuInfo = ShopListSubMenuInfo(context);

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
        title: thisMenuLabel,
        leading: menuButton,
        actions: actions,
      ),
      drawer: SubMenuDrawer(
        title: l10n.sub_title,
        parentMenuLabel: thisMenuLabel,
        subMenuInfo: shopListSubMenuInfo,
      ),
      endDrawer: SubMenuDrawer(
        title: l10n.sub_title,
        parentMenuLabel: thisMenuLabel,
        subMenuInfo: shopListSubMenuInfo,
      ),
      body: ListView(
        children: [
          for (var shop in shopList)
            ShopCard(
              shop: shop,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).go('/shop_list/add'),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Footer(
        currentMenuLabel: thisMenuLabel,
        mainMenuInfo: favosMenuInfo,
      ),
    );
  }
}
