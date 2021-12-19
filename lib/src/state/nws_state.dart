import 'package:flutter/foundation.dart';
import 'package:flutter_weather/src/api/data/forecast.dart';
import 'package:flutter_weather/src/api/data/grid_points.dart';
import 'package:flutter_weather/src/api/data/observations.dart';
import 'package:flutter_weather/src/api/data/points.dart';
import 'package:flutter_weather/src/api/nws.dart';

class NWSState extends ChangeNotifier {
  Points? _points;
  final _observations = <String, Observations>{};
  GridPoints? _gridPoints;
  Forecast? _forecast;

  Iterable<NWSStation> get stations =>
      _points?.features.map((e) => NWSStation(
            stationName: e.properties.name,
            stationIdentifier: e.properties.stationIdentifier,
            latitude: e.geometry.coordinates[0],
            longitude: e.geometry.coordinates[1],
          )) ??
      [];

  Map<String, Conditions> get conditions => {
        for (var e in _observations.entries)
          e.key: Conditions(
            dewPoint: e.value.properties.dewpoint.value,
            relativeHumidity: e.value.properties.relativeHumidity.value,
            temperature: e.value.properties.temperature.value,
            windDirection: e.value.properties.windDirection.value,
            windSpeed: e.value.properties.windSpeed.value,
            windGust: e.value.properties.windGust.value,
            icon: e.value.properties.icon,
            textDescription: e.value.properties.textDescription,
            barometricPressure: e.value.properties.barometricPressure.value,
            visibility: e.value.properties.visibility.value,
            windChill: e.value.properties.windChill.value,
            heatIndex: e.value.properties.heatIndex.value,
            timestamp: e.value.properties.timestamp,
          )
      };

  GridPoints? get gridPoints => _gridPoints;
  Forecast? get forecast => _forecast;

  Future<void> setCoordinates({required double latitude, required double longitude}) async {
    _points = await NWS().points(latitude: latitude, longitude: longitude);
    notifyListeners();
  }

  Future<void> getConditions({required String stationIdentifier}) async {
    _observations[stationIdentifier] = await NWS().observations(stationIdentifier: stationIdentifier);
    notifyListeners();
  }

  Future<void> getGridPoints({required double latitude, required double longitude}) async {
    _gridPoints = await NWS().gridPoints(latitude: latitude, longitude: longitude);
    notifyListeners();
  }

  Future<void> getForecast({required String wfo, required int x, required int y}) async {
    _forecast = await NWS().forecast(wfo: wfo, x: x, y: y);
    notifyListeners();
  }
}

class NWSStation {
  NWSStation({
    required this.stationName,
    required this.stationIdentifier,
    required this.latitude,
    required this.longitude,
  });

  double latitude;
  double longitude;
  String stationIdentifier;
  String stationName;
}

class Conditions {
  Conditions({
    required this.dewPoint,
    required this.relativeHumidity,
    required this.temperature,
    required this.windDirection,
    required this.windSpeed,
    required this.windGust,
    required this.icon,
    required this.textDescription,
    required this.barometricPressure,
    required this.visibility,
    required this.windChill,
    required this.heatIndex,
    required this.timestamp,
  });

  double? dewPoint;
  double? relativeHumidity;
  double? temperature;
  double? windDirection;
  double? windSpeed;
  double? windGust;
  String icon;
  String textDescription;
  double? barometricPressure;
  double? visibility;
  double? windChill;
  double? heatIndex;
  DateTime timestamp;
}
