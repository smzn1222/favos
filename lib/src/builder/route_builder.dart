import 'package:favos/src/info/route_info.dart';
import 'package:go_router/go_router.dart';

GoRouter routeBuilder() {
  RouteInfo routeInfo = RouteInfo();
  List<GoRoute> routes = convertToGoRouter(routeInfo.routes);
  routes.add(GoRoute(
    path: '/',
    redirect: (context, state) => routeInfo.initialLocation,
  ));

  return GoRouter(
    initialLocation: routeInfo.initialLocation,
    routes: routes,
    errorPageBuilder: routeInfo.errorPageBuilder != null
        ? (context, state) => routeInfo.errorPageBuilder!(routeInfo.errorPage)
        : null,
    errorBuilder: routeInfo.errorPageBuilder == null
        ? (context, state) => routeInfo.errorPage
        : null,
  );
}

List<GoRoute> convertToGoRouter(List<RouteItem> routes) {
  List<GoRoute> goRoutes = [];
  for (var route in routes) {
    goRoutes.add(GoRoute(
      path: route.path,
      pageBuilder: route.customPageBuilder != null
          ? (context, state) => route.customPageBuilder!(route.screen)
          : null,
      builder: route.customPageBuilder == null
          ? (context, state) => route.screen
          : null,
      routes: route.childRoutes != null
          ? convertToGoRouter(route.childRoutes!)
          : [],
    ));
  }

  return goRoutes;
}
