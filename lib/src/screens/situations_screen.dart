import 'package:favos/src/common/widget/header.dart';
import 'package:favos/src/common/widget/sub_menu_drawer.dart';
import 'package:favos/src/info/shop_list_sub_menu_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SituationsScreen extends StatelessWidget {
  const SituationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final String thisMenuLabel = l10n.manage_situations;
    final shopListSubMenuInfo = ShopListSubMenuInfo(context);

    return Scaffold(
      appBar: Header(
        title: thisMenuLabel,
        actions: [
          TextButton(
            child: Text(l10n.done),
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ],
      ),
      drawer: SubMenuDrawer(
        title: l10n.sub_title,
        parentMenuLabel: thisMenuLabel,
        subMenuInfo: shopListSubMenuInfo,
      ),
      body: Center(
        child: Placeholder(),
      ),
    );
  }
}
