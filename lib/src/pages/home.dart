import 'package:flutter/material.dart';
import 'package:flutter_weather/src/routing/route_state_scope.dart';

class Home extends MaterialPage {
  const Home() : super(child: const _Home());
}

class _Home extends StatelessWidget {
  const _Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(onPressed: () => RouteStateScope.of(context).pushRoute('/authentication'), child: const Text('Aauthentication')),
              ElevatedButton(onPressed: () => RouteStateScope.of(context).pushRoute('/forecast'), child: const Text('Forecast')),
              ElevatedButton(onPressed: () => RouteStateScope.of(context).pushRoute('/map'), child: const Text('Map')),
              ElevatedButton(onPressed: () => RouteStateScope.of(context).pushRoute('/graph?foo=foo'), child: const Text('Graph')),
            ],
          ),
        ),
      ));
}
