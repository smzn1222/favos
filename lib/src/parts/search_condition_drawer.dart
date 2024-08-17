import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchConditionDrawer extends StatelessWidget {
  const SearchConditionDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final String title = l10n.shop_condition_drawer_title;

    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 68.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(title),
                        )),
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => GoRouter.of(context).pop()),
                  ]),
            ),
          ),
          TextFormField(
            cursorColor: const Color.fromRGBO(131, 124, 124, 1),
            decoration: const InputDecoration(
              labelText: 'お店の名前',
              fillColor: Color.fromRGBO(240, 240, 240, 1),
              filled: true,
              border: InputBorder.none,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            cursorColor: const Color.fromRGBO(131, 124, 124, 1),
            decoration: const InputDecoration(
              labelText: 'エリア',
              fillColor: Color.fromRGBO(240, 240, 240, 1),
              filled: true,
              border: InputBorder.none,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text('検索'),
          ),
        ],
      ),
    );
  }
}
