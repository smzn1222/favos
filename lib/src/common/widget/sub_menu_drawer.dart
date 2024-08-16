import 'package:favos/src/common/interface/sub_menu_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubMenuDrawer extends StatelessWidget {
  const SubMenuDrawer({
    super.key,
    required this.title,
    required this.parentMenuLabel,
    required this.subMenuInfo,
  });

  final String title;
  final String parentMenuLabel;
  final SubMenuInfo subMenuInfo;

  @override
  Widget build(BuildContext context) {
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
          for (var menuItem in subMenuInfo.menuItems)
            ListTile(
              title: Text(menuItem.label),
              onTap: () {
                if (parentMenuLabel == menuItem.label) {
                  GoRouter.of(context).pop();
                  return;
                }
                GoRouter.of(context).go(menuItem.route);
              },
              selected: parentMenuLabel == menuItem.label,
              selectedColor: Theme.of(context).colorScheme.inversePrimary,
            ),
        ],
      ),
    );
  }
}
