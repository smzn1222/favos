import 'package:favos/src/content/initial_screen.dart';
import 'package:favos/src/content/settings.dart';
import 'package:favos/src/content/share_menu.dart';
import 'package:favos/src/content/shop_list.dart';
import 'package:favos/src/error/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavosApp extends StatelessWidget {
  const FavosApp({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final contentsPathList = ['/shop_list', '/share_menu', '/settings'];
    final pageList = [ShopList(), ShareMenu(), Settings()];
    final String firstContentPath = contentsPathList[0];

    return ChangeNotifierProvider(
      create: (context) => FavosAppState(),
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 34, 104, 255)),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',

        // 以下のようにroutesを使うと、ページ遷移時のアニメーションが有効になる
        // routes: {
        //   '/': (context) => InitialScreen(firstContentPath: firstContentPath),
        //   '/shop_list': (context) => ShopList(),
        //   '/share_menu': (context) => ShareMenu(),
        //   '/settings': (context) => Settings(),
        // },

        // ルーティング
        // 以下のようにonGenerateRouteを使うと、ページ遷移時のアニメーションを無効になる
        onGenerateRoute: (currentRouteSettings) {
          String? routeName = currentRouteSettings.name;
          if (routeName != null) {
            if (routeName == '/') {
              return MaterialPageRoute(
                  builder: (context) =>
                      InitialScreen(firstContentPath: firstContentPath));
            } else if (contentsPathList.contains(routeName)) {
              return PageRouteBuilder(
                settings: currentRouteSettings,
                pageBuilder: (context, animation1, animation2) {
                  return pageList[contentsPathList.indexOf(routeName)];
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child; // アニメーションを無効にして、ただのchildを返す
                },
              );
            } else {
              // 未定義のルートの場合の処理
              return MaterialPageRoute(builder: (context) => ErrorScreen());
            }
          } else {
            // routeNameがnullの場合の処理
            return MaterialPageRoute(builder: (context) => ErrorScreen());
          }
        },
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
