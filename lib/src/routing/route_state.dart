import 'package:flutter/material.dart';

import 'parsed_route.dart';
import 'parser.dart';

class RouteState extends ChangeNotifier {
  final RouteParser _parser;
  final List<ParsedRoute> routes;

  RouteState(this._parser) : routes = [_parser.initialRoute];

  ParsedRoute get route => routes.last;

  void push(ParsedRoute route) {
    // Don't notify listeners if the path hasn't changed.
    if (routes.last == route) return;

    routes.add(route);
    notifyListeners();
  }

  void set(ParsedRoute route) {
    routes.clear();
    routes.add(route);
    notifyListeners();
  }

  Future<void> pushRoute(String route) async {
    push(await _parser.parseRouteInformation(RouteInformation(location: route)));
  }

  Future<void> setRoute(String route) async {
    set(await _parser.parseRouteInformation(RouteInformation(location: route)));
  }

  bool pop() {
    if (routes.length == 1) return false;
    routes.removeLast();
    notifyListeners();
    return true;
  }
}
