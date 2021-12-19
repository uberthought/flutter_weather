// import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'routing.dart';

class RouteParser extends RouteInformationParser<ParsedRoute> {
  final ParsedRoute initialRoute;

  RouteParser() : initialRoute = ParsedRoute(path: '/splash');

  @override
  Future<ParsedRoute> parseRouteInformation(RouteInformation routeInformation) async {
    // if (kDebugMode) print('parseRouteInformation ' + (routeInformation.location ?? 'null'));
    return ParsedRoute(path: routeInformation.location ?? '/');
  }
}
