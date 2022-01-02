import 'package:flutter/material.dart';
import 'package:flutter_weather/src/state/forecast_state.dart';
import 'package:flutter_weather/src/state/nws_state.dart';
import 'package:provider/provider.dart';
import 'routing/delegate.dart';
import 'routing/parser.dart';
import 'routing/route_state.dart';
import 'routing/route_state_scope.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  late final RouteParser _routeParser;
  late final RouteState _routeState;

  @override
  void initState() {
    _routeParser = RouteParser();
    _routeState = RouteState(_routeParser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RouteStateScope(
      notifier: _routeState,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<NWSState>(create: (_) => NWSState()),
          ChangeNotifierProvider<ForecastState>(create: (_) => ForecastState()),
        ],
        child: MaterialApp.router(
          title: 'Weather',
          routeInformationParser: _routeParser,
          routerDelegate: AppRouterDelegate(navigatorKey: _navigatorKey, routeState: _routeState),
          theme: ThemeData(),
        ),
      ),
    );
  }
}
