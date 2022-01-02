import 'dart:math' as math;
import 'dart:core';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/src/pages/stations_widget.dart';
import 'package:flutter_weather/src/routing/route_state_scope.dart';
import 'package:provider/provider.dart';

import 'package:flutter_weather/src/state/forecast_state.dart';

class GraphPage extends MaterialPage {
  GraphPage() : super(child: Scaffold(appBar: AppBar(), body: const Body()));
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecastState = context.watch<ForecastState>();

    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => forecastState.setCoordinates(latitude: 27.9585274, longitude: -82.7886386),
            child: const Text('Set Coordinates'),
          ),
          ElevatedButton(
            onPressed: () => RouteStateScope.of(context).pushRoute('/forecast'),
            child: const Text('Forecast'),
          ),
          ElevatedButton(
            onPressed: () => RouteStateScope.of(context).pushRoute('/graph?foo=foo'),
            child: const Text('foo'),
          ),
          ElevatedButton(
            onPressed: () => RouteStateScope.of(context).pushRoute('/graph?foo=foo2'),
            child: const Text('foo2'),
          ),
          const Padding(padding: EdgeInsets.all(8.0), child: StationsWidget()),
          const GraphWidget(),
        ],
      ),
    );
  }
}

class GraphWidget extends StatelessWidget {
  const GraphWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecastState = context.watch<ForecastState>();
    if (!forecastState.hasForecast) return Container();

    final forecast = forecastState.forecast;
    if (forecast == null) return Container();

    final spotsDay = <FlSpot>[];
    final spotsNight = <FlSpot>[];
    final labels = <String>[];
    var min = double.infinity;
    var max = double.negativeInfinity;
    for (int i = 0; i < forecast.properties!.periods.length; i++) {
      final period = forecast.properties!.periods[i];
      if (period.isDaytime) {
        spotsDay.add(FlSpot(i.toDouble(), period.temperature.toDouble()));
      } else {
        spotsNight.add(FlSpot(i.toDouble(), period.temperature.toDouble()));
      }
      labels.add(period.name);
      min = math.min(min, period.temperature.toDouble());
      max = math.max(max, period.temperature.toDouble());
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 128.0),
      child: SizedBox(
        height: 300,
        child: LineChart(
          LineChartData(
              lineBarsData: [
                LineChartBarData(spots: spotsDay),
                LineChartBarData(spots: spotsNight),
              ],
              minY: min - 5,
              maxY: max + 5,
              titlesData: FlTitlesData(
                topTitles: SideTitles(),
                bottomTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  rotateAngle: 90,
                  getTitles: (i) => labels[i.toInt()],
                ),
              )),
        ),
      ),
    );
  }
}
