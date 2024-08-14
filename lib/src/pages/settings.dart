import 'package:favos/src/app/favos_app.dart';
import 'package:favos/src/common_widget/footer.dart';
import 'package:favos/src/common_widget/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<FavosAppState>(context);

    final l10n = L10n.of(context);

    final menuList = [l10n.shop_list, l10n.share, l10n.settings];
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
