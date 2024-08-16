import 'package:favos/src/common/widget/footer.dart';
import 'package:favos/src/common/widget/header.dart';
import 'package:favos/src/common/widget/sub_menu_drawer.dart';
import 'package:favos/src/info/main_menu_info.dart';
import 'package:favos/src/info/sub_menu_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopListScreen extends StatelessWidget {
  ShopListScreen({super.key});
  late final MainMenuInfo mainMenuInfo;
  late final ShopListSubMenuInfo shopListSubMenuInfo;

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
      body: Center(
        child: Placeholder(),
      ),
      bottomNavigationBar: Footer(
        currentMenuLabel: thisMenuLabel,
        mainMenuInfo: favosMenuInfo,
      ),
    );
  }
}
