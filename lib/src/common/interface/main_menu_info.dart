import 'package:flutter/material.dart';

class MainMenuItem {
  final String title;
  final String label;
  final String route;
  final IconData icon;

  MainMenuItem({
    required this.title,
    required this.label,
    required this.route,
    required this.icon,
  });
}

abstract interface class MainMenuInfo {
  late final List<MainMenuItem> menuItems;
}
