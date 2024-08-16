import 'package:favos/src/common/widget/footer.dart';
import 'package:favos/src/common/widget/header.dart';
import 'package:favos/src/info/favos_menu_info.dart';
import 'package:favos/src/info/settings_sub_menu_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final String thisMenuLabel = l10n.settings;
    final favosMenuInfo = FavosMenuInfo(context);
    final settingSubMenuInfo = SettingsSubMenuInfo(context);

    final IconButton homeButton = IconButton(
        icon: Icon(Icons.home), onPressed: () => GoRouter.of(context).go('/'));

    return Scaffold(
      appBar: Header(
        title: thisMenuLabel,
        leading: homeButton,
      ),
      body: Center(
        child: ListView(
          children: [
            for (var menuItem in settingSubMenuInfo.menuItems)
              ListTile(
                title: Text(menuItem.label),
                onTap: () {
                  GoRouter.of(context).go(menuItem.route);
                },
              ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(
        mainMenuInfo: favosMenuInfo,
        currentMenuLabel: thisMenuLabel,
      ),
    );
  }
}
