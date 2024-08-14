import 'package:favos/src/pages/areas.dart';
import 'package:favos/src/pages/categories.dart';
import 'package:favos/src/pages/deleted_list.dart';
import 'package:favos/src/pages/settings.dart';
import 'package:favos/src/pages/share_menu.dart';
import 'package:favos/src/pages/shop_form.dart';
import 'package:favos/src/pages/shop_list.dart';
import 'package:favos/src/error/error_screen.dart';
import 'package:favos/src/pages/situations.dart';
import 'package:favos/src/pages/tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:favos/src/common_function/custom_transition_page.dart';

class FavosApp extends StatelessWidget {
  FavosApp({super.key, required this.title}) {
    _router = GoRouter(
      initialLocation: '/shop_list',
      routes: [
        // ルートパスへのアクセス時のリダイレクト
        GoRoute(
          path: '/',
          redirect: (context, state) => '/shop_list',
        ),
        GoRoute(
            path: '/shop_list',
            pageBuilder: (context, state) => withoutAnimation(ShopList()),
            routes: [
              GoRoute(
                path: 'add',
                pageBuilder: (context, state) => sideSlideAnimation(ShopForm()),
              ),
              GoRoute(
                path: 'areas',
                pageBuilder: (context, state) => sideSlideAnimation(Areas()),
              ),
              GoRoute(
                  path: 'categories',
                  pageBuilder: (context, state) =>
                      sideSlideAnimation(Categories())),
              GoRoute(
                  path: 'situations',
                  pageBuilder: (context, state) =>
                      sideSlideAnimation(Situations())),
              GoRoute(
                  path: 'tags',
                  pageBuilder: (context, state) => sideSlideAnimation(Tags())),
              GoRoute(
                  path: 'deleted_list',
                  pageBuilder: (context, state) =>
                      upperSlideAnimation(DeletedList())),
            ]),
        GoRoute(
          path: '/share_menu',
          pageBuilder: (context, state) => withoutAnimation(ShareMenu()),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) => withoutAnimation(Settings()),
        ),
        GoRoute(
            path: '/error',
            pageBuilder: (context, state) => withoutAnimation(ErrorScreen())),
      ],
      // 存在しないパスへのアクセス時のエラーページ
      errorPageBuilder: (context, state) => withoutAnimation(ErrorScreen()),
    );
  }

  final String title;
  late final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavosAppState(),
      child: MaterialApp.router(
        title: title,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 34, 104, 255)),
        ),
        darkTheme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 34, 104, 255),
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        // localize
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        // routing
        routerConfig: _router,
      ),
    );
  }
}

class FavosAppState extends ChangeNotifier {
  int _currentLocationIndex = 0;

  int get currentLocationIndex => _currentLocationIndex;

  set currentLocationIndex(int index) {
    _currentLocationIndex = index;
    notifyListeners();
  }

  void changeLocation(int index) {
    currentLocationIndex = index;
  }
}
