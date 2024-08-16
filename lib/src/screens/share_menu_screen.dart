import 'package:favos/src/common/widget/footer.dart';
import 'package:favos/src/common/widget/header.dart';
import 'package:favos/src/info/main_menu_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShareMenuScreen extends StatelessWidget {
  const ShareMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final String thisMenuLabel = l10n.share;
    final favosMenuInfo = FavosMenuInfo(context);

    final IconButton homeButton = IconButton(
        icon: Icon(Icons.home), onPressed: () => GoRouter.of(context).go('/'));

    return Scaffold(
      appBar: Header(
        title: thisMenuLabel,
        leading: homeButton,
      ),
      body: Center(
        child: Placeholder(),
      ),
      bottomNavigationBar: Footer(
        mainMenuInfo: favosMenuInfo,
        currentMenuLabel: thisMenuLabel,
      ),
    );
  }
}
