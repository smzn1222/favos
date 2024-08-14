import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubMenuDrawer extends StatelessWidget {
  const SubMenuDrawer({
    super.key,
    required this.title,
    required this.currentPath,
    required this.subMenuList,
    required this.subRouteList,
  });

  final String title;
  final String currentPath;
  final List<String> subMenuList;
  final List<String> subRouteList;

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
          for (var i = 0; i < subMenuList.length; i++)
            ListTile(
              title: Text(subMenuList[i]),
              onTap: () {
                if (currentPath == subRouteList[i]) {
                  GoRouter.of(context).pop();
                  return;
                }
                GoRouter.of(context).go('$currentPath${subRouteList[i]}');
              },
            ),
        ],
      ),
    );
  }
}
