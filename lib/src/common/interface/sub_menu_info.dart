class SubMenuItem {
  final String title;
  final String label;
  final String route;

  SubMenuItem({
    required this.title,
    required this.label,
    required this.route,
  });
}

abstract interface class SubMenuInfo {
  late final List<SubMenuItem> menuItems;
}
