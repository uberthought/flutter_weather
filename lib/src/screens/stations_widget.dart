import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_weather/src/state/forecast_state.dart';

class StationsWidget extends StatelessWidget {
  const StationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecastState = context.watch<ForecastState>();
    if (!forecastState.hasForecast) return Container();
    final stationIdentifiers = forecastState.stationIdentifiers;

    return Wrap(
      children: [
        for (var stationIdentifier in stationIdentifiers)
          OutlinedButton(
            onPressed: () => forecastState.setStation(stationIdentifier: stationIdentifier),
            child: Text(stationIdentifier),
          ),
      ],
    );
  }
}
