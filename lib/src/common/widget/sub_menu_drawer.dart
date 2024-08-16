import 'package:favos/src/info/sub_menu_info.dart';
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
        children: <Widget>[
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
          for (var i = 0; i < subMenuInfo.menuItems.length; i++)
            ListTile(
              title: Text(subMenuInfo.menuItems[i].label),
              onTap: () {
                if (parentMenuLabel == subMenuInfo.menuItems[i].label) {
                  GoRouter.of(context).pop();
                  return;
                }
                GoRouter.of(context).go(subMenuInfo.menuItems[i].route);
              },
              selected: parentMenuLabel == subMenuInfo.menuItems[i].label,
              selectedColor: Theme.of(context).colorScheme.inversePrimary,
            ),
        ],
      ),
    );
  }
}
