import 'package:favos/src/common/interface/sub_menu_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final class SettingsSubMenuInfo implements SubMenuInfo {
  @override
  late final List<SubMenuItem> menuItems;

  static const SettingsSubMenuInfo? _instance = null;

  factory SettingsSubMenuInfo(BuildContext context) {
    return _instance ?? SettingsSubMenuInfo._internal(context);
  }

  SettingsSubMenuInfo._internal(BuildContext context) {
    final l10n = L10n.of(context);

    menuItems = [
      SubMenuItem(
        title: 'search_condition_setting',
        label: l10n.search_condition_setting,
        route: '/settings/search_condition',
      ),
      SubMenuItem(
        title: 'theme_setting',
        label: l10n.theme_setting,
        route: '/settings/theme',
      ),
      SubMenuItem(
        title: 'delete_all_setting',
        label: l10n.delete_all_setting,
        route: '/settings/delete_all',
      ),
    ];
  }
}
