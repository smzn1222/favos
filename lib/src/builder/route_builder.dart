import 'package:favos/src/info/route_info.dart';
import 'package:go_router/go_router.dart';

// Infoクラスで定義したルート設定を読み込み、GoRouterに変換する
GoRouter routeBuilder() {
  RouteInfo routeInfo = RouteInfo();
  List<GoRoute> routes = convertToGoRouter(routeInfo.routes);

  // 根本のルートは初期ページにリダイレクトする
  routes.add(GoRoute(
    path: '/',
    redirect: (context, state) => routeInfo.initialLocation,
  ));

  return GoRouter(
    initialLocation: routeInfo.initialLocation,
    routes: routes,
    errorPageBuilder: routeInfo.errorPageBuilder != null
        ? (context, state) => routeInfo.errorPageBuilder!(
            context, state, routeInfo.getErrorScreen(context, state))
        : null,
    errorBuilder: routeInfo.errorPageBuilder == null
        ? (context, state) => routeInfo.getErrorScreen(context, state)
        : null,
  );
}

List<GoRoute> convertToGoRouter(List<RouteItem> routes) {
  List<GoRoute> goRoutes = [];
  for (var route in routes) {
    goRoutes.add(GoRoute(
      path: route.path,
      pageBuilder: route.customPageBuilder != null
          ? (context, state) => route.customPageBuilder!(
              context, state, route.getScreen(context, state))
          : null,
      builder: route.customPageBuilder == null
          ? (context, state) => route.getScreen(context, state)
          : null,
      routes: route.childRoutes != null
          ? convertToGoRouter(route.childRoutes!)
          : [],
    ));
  }

  return goRoutes;
}
