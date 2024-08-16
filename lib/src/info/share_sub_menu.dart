import 'package:favos/src/common/interface/sub_menu_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final class ShareSubMenuInfo implements SubMenuInfo {
  @override
  late final List<SubMenuItem> menuItems;

  static const ShareSubMenuInfo? _instance = null;

  factory ShareSubMenuInfo(BuildContext context) {
    return _instance ?? ShareSubMenuInfo._internal(context);
  }

  ShareSubMenuInfo._internal(BuildContext context) {
    final l10n = L10n.of(context);

    menuItems = [
      SubMenuItem(
        title: 'sharing',
        label: l10n.sharing,
        route: '/share_menu/sharing',
      ),
      SubMenuItem(
        title: 'shared_qr',
        label: l10n.shared_qr,
        route: '/share_menu/shared_qr',
      ),
    ];
  }
}
