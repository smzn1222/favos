import 'package:favos/src/app/favos_app.dart';
import 'package:favos/src/common/widget/footer.dart';
import 'package:favos/src/common/widget/header.dart';
import 'package:favos/src/info/main_menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShareMenuScreen extends StatelessWidget {
  const ShareMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<FavosAppState>(context);

    final l10n = L10n.of(context);
    final String thisMenuLabel = l10n.share;
    final favosMenuInfo = FavosMenuInfo(context);

    return Scaffold(
      appBar: Header(
        title: thisMenuLabel,
      ),
      body: Center(
        child: Text(
            'Share Menu. Index of current location : ${appState.currentLocationIndex}'),
      ),
      bottomNavigationBar: Footer(
        mainMenuInfo: favosMenuInfo,
        currentMenuLabel: thisMenuLabel,
      ),
    );
  }
}
