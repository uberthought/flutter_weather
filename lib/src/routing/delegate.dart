import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/src/screens/authentication_page.dart';
import 'package:flutter_weather/src/screens/graph_page.dart';
import 'package:flutter_weather/src/screens/home.dart';
import 'package:flutter_weather/src/screens/map_page.dart';
import 'package:flutter_weather/src/screens/forecast_page.dart';
import 'package:flutter_weather/src/screens/splash.dart';

import 'routing.dart';

class AppRouterDelegate extends RouterDelegate<ParsedRoute> with ChangeNotifier, PopNavigatorRouterDelegateMixin<ParsedRoute> {
  AppRouterDelegate({required this.navigatorKey, required this.routeState}) {
    routeState.addListener(notifyListeners);
  }

  final RouteState routeState;
  bool showSplash = true;

  @override
  Widget build(BuildContext context) {
    // if (kDebugMode) print('build ' + routeState.route.path);

    return Navigator(
      key: navigatorKey,
      onPopPage: (route, dynamic result) {
        return route.didPop(result);
      },
      pages: [
        if (routeState.route.path == '/splash') const Splash(),
        if (routeState.route.path == '/') const Home(),
        if (routeState.route.path == '/authentication') ...[const Home(), AuthenticationPage()],
        if (routeState.route.path == '/forecast') ...[const Home(), ForecastPage()],
        if (routeState.route.path == '/map') ...[const Home(), MapPage()],
        if (routeState.route.path == '/graph') ...[const Home(), GraphPage()],
      ],
    );
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Future<void> setNewRoutePath(ParsedRoute configuration) async {
    // if (kDebugMode) print('setNewRoutePath ' + configuration.path);
    if (showSplash) {
      showSplash = false;
      routeState.route = ParsedRoute(path: '/splash');
    } else {
      routeState.route = configuration;
    }
    return SynchronousFuture(null);
  }

  @override
  ParsedRoute get currentConfiguration => routeState.route;

  @override
  void dispose() {
    routeState.removeListener(notifyListeners);
    routeState.dispose();
    super.dispose();
  }
}
