import 'package:flutter/material.dart';

class SubMenuDrawer extends StatelessWidget {
  const SubMenuDrawer({
    super.key,
    required this.title,
    required this.subMenuList,
  });

  final String title;
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
                        onPressed: () => Navigator.pop(context)),
                  ]),
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
