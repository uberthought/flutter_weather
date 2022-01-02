import 'package:flutter/widgets.dart';

import 'parsed_route.dart';

class RouteParser extends RouteInformationParser<ParsedRoute> {
  final ParsedRoute initialRoute;

  RouteParser() : initialRoute = ParsedRoute(path: '/splash');

  @override
  Future<ParsedRoute> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    return ParsedRoute(path: uri.path, parameters: uri.queryParameters);
  }

  @override
  RouteInformation? restoreRouteInformation(ParsedRoute configuration) {
    final uri = Uri(path: configuration.path, queryParameters: configuration.parameters.isEmpty ? null : configuration.parameters);
    return RouteInformation(location: uri.toString());
  }
}
