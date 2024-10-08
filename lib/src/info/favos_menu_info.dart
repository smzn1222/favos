import 'package:favos/src/common/interface/main_menu_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final class FavosMenuInfo implements MainMenuInfo {
  @override
  late final List<MainMenuItem> menuItems;

  static const FavosMenuInfo? _instance = null;

  factory FavosMenuInfo(BuildContext context) {
    return _instance ?? FavosMenuInfo._internal(context);
  }

  FavosMenuInfo._internal(BuildContext context) {
    final l10n = L10n.of(context);

    menuItems = [
      MainMenuItem(
        title: 'shop_list',
        label: l10n.shop_list,
        route: '/shop_list',
        icon: Icons.playlist_add_check,
      ),
      MainMenuItem(
        title: 'share',
        label: l10n.share,
        route: '/share_menu',
        icon: Icons.share,
      ),
      MainMenuItem(
        title: 'settings',
        label: l10n.settings,
        route: '/settings',
        icon: Icons.settings,
      ),
    ];
  }
}
