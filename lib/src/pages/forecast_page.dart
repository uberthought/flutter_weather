import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_weather/src/state/forecast_state.dart';

import 'forecast_widget.dart';
import 'stations_widget.dart';

class ForecastPage extends MaterialPage {
  ForecastPage() : super(child: Scaffold(appBar: AppBar(), body: const Body()));
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
          const Padding(padding: EdgeInsets.all(8.0), child: StationsWidget()),
          const ForecastWidget(),
        ],
      ),
    );
  }
}
