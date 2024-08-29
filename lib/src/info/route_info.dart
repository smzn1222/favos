import 'package:favos/src/common/function/page_builder_functions.dart';
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
import 'package:favos/src/screens/shop_detail_screen.dart';
import 'package:favos/src/screens/shop_form_screen.dart';
import 'package:favos/src/screens/shop_list_screen.dart';
import 'package:favos/src/screens/situations_screen.dart';
import 'package:favos/src/screens/tags_screen.dart';
import 'package:favos/src/screens/theme_setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteItem {
  final String path;
  final Widget Function(BuildContext, GoRouterState) getScreen;
  final Page Function(BuildContext, GoRouterState, Widget)? customPageBuilder;
  final List<RouteItem>? childRoutes;

  RouteItem({
    required this.path,
    required this.getScreen,
    this.customPageBuilder,
    this.childRoutes,
  });
}

final class RouteInfo {
  late final String initialLocation;
  late final List<RouteItem> routes;
  late final Widget Function(BuildContext, GoRouterState) getErrorScreen;
  late final Page Function(BuildContext, GoRouterState, Widget)?
      errorPageBuilder;

  static final RouteInfo _instance = RouteInfo._internal();

  factory RouteInfo() {
    return _instance;
  }

  RouteInfo._internal() {
    initialLocation = '/shop_list';
    routes = [
      RouteItem(
        path: '/shop_list',
        getScreen: (context, state) => ShopListScreen(),
        customPageBuilder: (context, state, screen) =>
            withoutAnimation(screen: screen),
        childRoutes: [
          RouteItem(
            path: 'detail',
            getScreen: (context, state) =>
                ShopDetailScreen(shopListRecord: state.extra as ShopListRecord),
            customPageBuilder: (context, state, screen) =>
                cupertinoModalBottomSheetAnimation(screen: screen),
            childRoutes: null,
          ),
          RouteItem(
            path: 'add',
            getScreen: (context, state) => ShopFormScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
          RouteItem(
            path: 'areas',
            getScreen: (context, state) => AreasScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
          RouteItem(
            path: 'categories',
            getScreen: (context, state) => CategoriesScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
          RouteItem(
            path: 'situations',
            getScreen: (context, state) => SituationsScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
          RouteItem(
            path: 'tags',
            getScreen: (context, state) => TagsScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
          RouteItem(
            path: 'deleted_list',
            getScreen: (context, state) => DeletedListScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
        ],
      ),
      RouteItem(
        path: '/share_menu',
        getScreen: (context, state) => ShareMenuScreen(),
        customPageBuilder: (context, state, screen) =>
            withoutAnimation(screen: screen),
        childRoutes: [
          RouteItem(
            path: 'sharing',
            getScreen: (context, state) => SharingScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
          RouteItem(
            path: 'shared_qr',
            getScreen: (context, state) => SharedQrScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
        ],
      ),
      RouteItem(
        path: '/settings',
        getScreen: (context, state) => SettingsScreen(),
        customPageBuilder: (context, state, screen) =>
            withoutAnimation(screen: screen),
        childRoutes: [
          RouteItem(
            path: 'search_condition',
            getScreen: (context, state) => SearchConditionSettingScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
          RouteItem(
            path: 'theme',
            getScreen: (context, state) => ThemeSettingScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
          RouteItem(
            path: 'delete_all',
            getScreen: (context, state) => DeleteAllScreen(),
            customPageBuilder: (context, state, screen) =>
                cupertinoUpperSlideAnimation(screen: screen),
            childRoutes: null,
          ),
        ],
      ),
    ];
    getErrorScreen = (context, state) => ErrorScreen();
    errorPageBuilder =
        (context, state, screen) => withoutAnimation(screen: screen);
  }
}
