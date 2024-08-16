import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.menuList,
    required this.iconList,
    required this.routeList,
    required this.currentMenuIndex,
  });

  final List<String> menuList;
  final List<IconData> iconList;
  final List<String> routeList;
  final int currentMenuIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: List.generate(menuList.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(iconList[index]),
          label: menuList[index],
        );
      }),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentMenuIndex,
      onTap: (index) {
        GoRouter.of(context).go(routeList[index]);
      },
      selectedItemColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
