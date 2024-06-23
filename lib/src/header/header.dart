import 'package:flutter/material.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header(
      {super.key,
      required this.title,
      required this.isMenuButtonVisible,
      required this.isSearchButtonVisible});
  final String title;
  final bool isMenuButtonVisible;
  final bool isSearchButtonVisible;

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HeaderState extends State<Header> {
  final menuButton = IconButton(icon: Icon(Icons.menu), onPressed: () {});
  final searchButton = IconButton(icon: Icon(Icons.search), onPressed: () {});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.isMenuButtonVisible ? menuButton : Container(),
      title: Text(widget.title),
      centerTitle: true,
      actions: [
        widget.isSearchButtonVisible ? searchButton : Container(),
      ],
      elevation: 1,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
