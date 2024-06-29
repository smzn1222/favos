import 'package:flutter/material.dart';

class SubMenuDrawer extends StatelessWidget {
  const SubMenuDrawer({
    super.key,
    required this.subMenuList,
  });

  final List<String> subMenuList;

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
              child: Text('Drawer Header'),
            ),
          ),
          for (var subMenu in subMenuList)
            ListTile(
              title: Text(subMenu),
              onTap: () {
                // Do something
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
