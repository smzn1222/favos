import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubMenuItem {
  final String title;
  final String label;
  final String route;

  SubMenuItem({
    required this.title,
    required this.label,
    required this.route,
  });
}

abstract interface class SubMenuInfo {
  late final List<SubMenuItem> menuItems;
}

final class ShopListSubMenuInfo implements SubMenuInfo {
  @override
  late final List<SubMenuItem> menuItems;

  static const ShopListSubMenuInfo? _instance = null;

  factory ShopListSubMenuInfo(BuildContext context) {
    return _instance ?? ShopListSubMenuInfo._internal(context);
  }

  ShopListSubMenuInfo._internal(BuildContext context) {
    final l10n = L10n.of(context);

    menuItems = [
      SubMenuItem(
        title: 'shop_list',
        label: l10n.shop_list,
        route: '/shop_list',
      ),
      SubMenuItem(
        title: 'shop_list_add',
        label: l10n.shop_list_add,
        route: '/shop_list/add',
      ),
      SubMenuItem(
        title: 'manage_areas',
        label: l10n.manage_areas,
        route: '/shop_list/areas',
      ),
      SubMenuItem(
        title: 'manage_categories',
        label: l10n.manage_categories,
        route: '/shop_list/categories',
      ),
      SubMenuItem(
        title: 'manage_situations',
        label: l10n.manage_situations,
        route: '/shop_list/situations',
      ),
      SubMenuItem(
        title: 'manage_tags',
        label: l10n.manage_tags,
        route: '/shop_list/tags',
      ),
      SubMenuItem(
        title: 'deleted_list',
        label: l10n.deleted_list,
        route: '/shop_list/deleted_list',
      ),
    ];
  }
}
