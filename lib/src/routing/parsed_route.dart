import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_weather/src/pages/authentication_page.dart';
import 'package:flutter_weather/src/pages/forecast_page.dart';
import 'package:flutter_weather/src/pages/graph_page.dart';
import 'package:flutter_weather/src/pages/home.dart';
import 'package:flutter_weather/src/pages/map_page.dart';
import 'package:flutter_weather/src/pages/splash.dart';

class ParsedRoute {
  final String path;
  final Map<String, String> parameters;
  Page? _page;

  ParsedRoute({required this.path, this.parameters = const {}});

  @override
  bool operator ==(other) {
    return (other is ParsedRoute) && path == other.path && mapEquals(parameters, other.parameters);
  }

  @override
  int get hashCode => path.hashCode ^ parameters.hashCode;

  Page get page {
    if (_page == null) {
      switch (path) {
        case '/splash':
          _page = const Splash();
          break;
        case '/authentication':
          _page = AuthenticationPage();
          break;
        case '/forecast':
          _page = ForecastPage();
          break;
        case '/map':
          _page = MapPage();
          break;
        case '/graph':
          _page = GraphPage();
          break;
        case '/':
        default:
          _page = const Home();
          break;
      }
    }
    return _page!;
  }
}
