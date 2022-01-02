import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'parsed_route.dart';
import 'route_state.dart';

class AppRouterDelegate extends RouterDelegate<ParsedRoute> with ChangeNotifier, PopNavigatorRouterDelegateMixin<ParsedRoute> {
  AppRouterDelegate({required this.navigatorKey, required this.routeState}) {
    routeState.addListener(notifyListeners);
  }

  final RouteState routeState;
  bool showSplash = true;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: buildPages(),
    );
  }

  bool _onPopPage(route, dynamic result) {
    if (!route.didPop(result)) return false;
    return routeState.pop();
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Future<void> setNewRoutePath(ParsedRoute configuration) async {
    if (showSplash) {
      showSplash = false;
      routeState.set(ParsedRoute(path: '/splash'));
    } else {
      routeState.set(configuration);
    }
    return SynchronousFuture(null);
  }

  @override
  ParsedRoute get currentConfiguration => routeState.route;

  List<Page> buildPages() => routeState.routes.map((e) => e.page).toList();

  @override
  void dispose() {
    routeState.removeListener(notifyListeners);
    routeState.dispose();
    super.dispose();
  }
}
