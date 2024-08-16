import 'package:favos/src/builder/route_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class FavosApp extends StatelessWidget {
  FavosApp({super.key, required this.title}) {
    _router = routeBuilder();
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
