import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';

import 'package:flutter_weather/src/api/data/forecast.dart';
import 'package:flutter_weather/src/api/data/observations.dart';
import 'package:flutter_weather/src/api/data/points.dart';
import 'package:flutter_weather/src/api/nws.dart';

class ForecastState extends ChangeNotifier {
  Points? _points;
  final _observations = <String, Observations>{};
  final _forecasts = <String, Forecast>{};

  String? _stationIdentifier;

  bool get hasForecast => _points != null && _stationIdentifier != null && _observations.containsKey(_stationIdentifier) && _forecasts.containsKey(_stationIdentifier);

  String? get stationName => getFeature(_stationIdentifier)?.properties.name;
  String? get stationIdentifier => getFeature(_stationIdentifier)?.properties.stationIdentifier;
  double? get stationLatitude => getFeature(_stationIdentifier)?.geometry.coordinates[1];
  double? get stationLongitude => getFeature(_stationIdentifier)?.geometry.coordinates[0];

  Feature? getFeature(String? stationIdentifier) {
    if (stationIdentifier == null) return null;
    final points = _points;
    if (points == null) return null;
    final feature = points.features.firstWhereOrNull((e) => e.properties.stationIdentifier == stationIdentifier);
    if (feature == null) return null;
    return feature;
  }

  Iterable<String> get stationIdentifiers {
    final points = _points;
    if (points == null) return [];
    return points.features.map((e) => e.properties.stationIdentifier);
  }

  Iterable<Station> get stations {
    final points = _points;
    if (points == null) return [];
    return points.features.map((e) => Station(
          stationIdentifier: e.properties.stationIdentifier,
          name: e.properties.name,
          latitude: e.geometry.coordinates[1],
          longitude: e.geometry.coordinates[0],
        ));
  }

  Observations? get observations {
    if (stationIdentifier == null) return null;
    return _observations[stationIdentifier];
  }

  Forecast? get forecast {
    if (stationIdentifier == null) return null;
    return _forecasts[stationIdentifier];
  }

  Future<void> setCoordinates({required double latitude, required double longitude}) async {
    _points = await NWS().points(latitude: latitude, longitude: longitude);

    final stationIdentifier = _points!.features.first.properties.stationIdentifier;
    setStation(stationIdentifier: stationIdentifier);
  }

  Future<void> setStation({required String stationIdentifier}) async {
    _stationIdentifier = stationIdentifier;
    _observations[stationIdentifier] = await NWS().observations(stationIdentifier: stationIdentifier);

    final latitude = _observations[stationIdentifier]!.geometry.coordinates[1];
    final longitude = _observations[stationIdentifier]!.geometry.coordinates[0];

    final gridPoints = await NWS().gridPoints(latitude: latitude, longitude: longitude);

    final wfo = gridPoints.properties.cwa;
    final x = gridPoints.properties.gridX;
    final y = gridPoints.properties.gridY;
    _forecasts[stationIdentifier] = await NWS().forecast(wfo: wfo, x: x, y: y);

    notifyListeners();
  }
}

class Station {
  String stationIdentifier;
  String name;
  double latitude;
  double longitude;

  Station({required this.stationIdentifier, required this.name, required this.latitude, required this.longitude});
}
