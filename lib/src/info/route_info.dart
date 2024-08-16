import 'package:favos/src/common/function/custom_transition_page.dart';
import 'package:favos/src/error/error_screen.dart';
import 'package:favos/src/screens/areas_screen.dart';
import 'package:favos/src/screens/categories_screen.dart';
import 'package:favos/src/screens/delete_all_screen.dart';
import 'package:favos/src/screens/deleted_list_screen.dart';
import 'package:favos/src/screens/search_condition_setting_screen.dart';
import 'package:favos/src/screens/settings_screen.dart';
import 'package:favos/src/screens/share_menu_screen.dart';
import 'package:favos/src/screens/shared_qr_screen.dart';
import 'package:favos/src/screens/sharing_screen.dart';
import 'package:favos/src/screens/shop_form_screen.dart';
import 'package:favos/src/screens/shop_list_screen.dart';
import 'package:favos/src/screens/situations_screen.dart';
import 'package:favos/src/screens/tags_screen.dart';
import 'package:favos/src/screens/theme_setting_screen.dart';
import 'package:flutter/material.dart';

class RouteItem {
  final String path;
  final Widget screen;
  final Function? customPageBuilder;
  final List<RouteItem>? childRoutes;

  RouteItem({
    required this.path,
    required this.screen,
    this.customPageBuilder,
    this.childRoutes,
  });
}

final class RouteInfo {
  late final String initialLocation;
  late final List<RouteItem> routes;
  late final Widget errorPage;
  late final Function? errorPageBuilder;

  static final RouteInfo _instance = RouteInfo._internal();

  factory RouteInfo() {
    return _instance;
  }

  RouteInfo._internal() {
    initialLocation = '/shop_list';
    routes = [
      RouteItem(
        path: '/shop_list',
        screen: ShopListScreen(),
        customPageBuilder: (page) => withoutAnimation(page),
        childRoutes: [
          RouteItem(
            path: 'add',
            screen: ShopFormScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
          RouteItem(
            path: 'areas',
            screen: AreasScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
          RouteItem(
            path: 'categories',
            screen: CategoriesScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
          RouteItem(
            path: 'situations',
            screen: SituationsScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
          RouteItem(
            path: 'tags',
            screen: TagsScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
          RouteItem(
            path: 'deleted_list',
            screen: DeletedListScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
        ],
      ),
      RouteItem(
        path: '/share_menu',
        screen: ShareMenuScreen(),
        customPageBuilder: (page) => withoutAnimation(page),
        childRoutes: [
          RouteItem(
            path: 'sharing',
            screen: SharingScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
          RouteItem(
            path: 'shared_qr',
            screen: SharedQrScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
        ],
      ),
      RouteItem(
        path: '/settings',
        screen: SettingsScreen(),
        customPageBuilder: (page) => withoutAnimation(page),
        childRoutes: [
          RouteItem(
            path: 'search_condition',
            screen: SearchConditionSettingScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
          RouteItem(
            path: 'theme',
            screen: ThemeSettingScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
          RouteItem(
            path: 'delete_all',
            screen: DeleteAllScreen(),
            customPageBuilder: (page) => upperSlideAnimation(page),
            childRoutes: null,
          ),
        ],
      ),
    ];
    errorPage = ErrorScreen();
    errorPageBuilder = (page) => withoutAnimation(page);
  }
}
