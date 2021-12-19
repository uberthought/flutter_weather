import 'package:flutter/material.dart';

import 'routing.dart';

class RouteState extends ChangeNotifier {
  final RouteParser _parser;
  ParsedRoute _route;

  RouteState(this._parser) : _route = _parser.initialRoute;

  ParsedRoute get route => _route;

  set route(ParsedRoute route) {
    // Don't notify listeners if the path hasn't changed.
    if (_route == route) return;

    _route = route;
    notifyListeners();
  }

  Future<void> go(String route) async {
    this.route = await _parser.parseRouteInformation(RouteInformation(location: route));
  }
}
