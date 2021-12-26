import 'package:flutter/material.dart';
import 'package:flutter_weather/src/api/data/forecast.dart';
import 'package:flutter_weather/src/state/forecast_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather/src/api/extensions/nws_extensions.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(padding: EdgeInsets.all(8.0), child: Station()),
        Padding(padding: EdgeInsets.all(8.0), child: Observations()),
        Padding(padding: EdgeInsets.all(8.0), child: Forecast()),
      ],
    );
  }
}

class Station extends StatelessWidget {
  const Station({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecastState = context.watch<ForecastState>();

    if (!forecastState.hasForecast) return Container();

    return Table(
      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
      children: [
        TableRow(children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text('Station Name', textAlign: TextAlign.right),
          ),
          Text(forecastState.stationName!)
        ]),
        TableRow(children: [const Text('Station Identifier'), Text(forecastState.stationIdentifier!)]),
        TableRow(children: [const Text('Latitude'), Text(forecastState.stationLatitude!.toString())]),
        TableRow(children: [const Text('Longitude'), Text(forecastState.stationLongitude!.toString())]),
      ],
    );
  }
}

class Observations extends StatelessWidget {
  const Observations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecastState = context.watch<ForecastState>();
    final observations = forecastState.observations;

    if (observations == null) return Container();

    return Table(
      children: [
        TableRow(children: [const Text('Temperature'), Text((observations.properties.temperature.value?.toStringAsFixed(1) ?? '') + 'C')]),
        TableRow(children: [const Text('Barometric Pressure'), Text(observations.properties.barometricPressure.value.toString())]),
        TableRow(children: [const Text('Dewpoint'), Text(observations.properties.dewpoint.value.toString())]),
        TableRow(children: [const Text('Relative Humidity'), Text((observations.properties.relativeHumidity.value?.toStringAsFixed(0) ?? '') + '%')]),
      ],
    );
  }
}

class Forecast extends StatelessWidget {
  const Forecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecastState = context.watch<ForecastState>();

    final forecast = forecastState.forecast;

    if (forecast == null) return Container();

    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Updated'),
                const SizedBox(width: 10),
                Text(forecast.properties!.updated.toString()),
              ],
            ),
            for (var period in forecast.properties!.periods)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ForecastPeriod(period: period),
              ),
          ],
        )
      ],
    );
  }
}

class ForecastPeriod extends StatelessWidget {
  const ForecastPeriod({Key? key, required this.period}) : super(key: key);

  final Period period;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(period.name),
        Table(
          children: [
            TableRow(children: [const Text('Temperature'), Text(period.temperatureC.toStringAsFixed(1) + 'C')]),
            TableRow(children: [const Text('Short Forecast'), Text(period.shortForecast)]),
          ],
        ),
        Text(period.detailedForecast),
      ],
    );
  }
}
