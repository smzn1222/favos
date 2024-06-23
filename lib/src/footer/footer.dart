import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final menuList = ['お店リスト', '共有', '設定'];
  final iconList = [Icons.playlist_add_check, Icons.share, Icons.settings];
  final routeList = ['/shop_list', '/share_menu', '/settings'];
  int _currentIndex = 0;

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
      currentIndex: _currentIndex,
      onTap: (index) {
        _currentIndex = index;
        Navigator.pushNamed(context, routeList[index]);
      },
      selectedItemColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
