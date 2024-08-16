import 'package:favos/src/common/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchConditionSettingScreen extends StatelessWidget {
  const SearchConditionSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final String thisMenuLabel = l10n.search_condition_setting;

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
      body: Center(
        child: Placeholder(),
      ),
    );
  }
}
