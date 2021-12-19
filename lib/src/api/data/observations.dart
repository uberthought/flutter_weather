import 'package:json_annotation/json_annotation.dart';

part 'observations.g.dart';

@JsonSerializable()
class Observations {
  Observations({
    required this.id,
    required this.type,
    required this.geometry,
    required this.properties,
  });

  final String id;
  final String type;
  final Geometry geometry;
  final Properties properties;

  factory Observations.fromJson(Map<String, dynamic> json) => _$ObservationsFromJson(json);
  Map<String, dynamic> toJson() => _$ObservationsToJson(this);
}

@JsonSerializable()
class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  final String type;
  final List<double> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Properties {
  Properties({
    required this.id,
    required this.type,
    required this.elevation,
    required this.station,
    required this.timestamp,
    required this.rawMessage,
    required this.textDescription,
    required this.icon,
    required this.presentWeather,
    required this.temperature,
    required this.dewpoint,
    required this.windDirection,
    required this.windSpeed,
    required this.windGust,
    required this.barometricPressure,
    required this.seaLevelPressure,
    required this.visibility,
    required this.maxTemperatureLast24Hours,
    required this.minTemperatureLast24Hours,
    required this.precipitationLastHour,
    required this.precipitationLast3Hours,
    required this.precipitationLast6Hours,
    required this.relativeHumidity,
    required this.windChill,
    required this.heatIndex,
    required this.cloudLayers,
  });

  @JsonKey(name: '@id')
  String id;
  @JsonKey(name: '@type')
  String type;
  final Elevation elevation;
  final String station;
  final DateTime timestamp;
  final String rawMessage;
  final String textDescription;
  final String icon;
  final List<dynamic> presentWeather;
  final BarometricPressure temperature;
  final BarometricPressure dewpoint;
  final BarometricPressure windDirection;
  final BarometricPressure windSpeed;
  final BarometricPressure windGust;
  final BarometricPressure barometricPressure;
  final BarometricPressure seaLevelPressure;
  final BarometricPressure visibility;
  final Elevation maxTemperatureLast24Hours;
  final Elevation minTemperatureLast24Hours;
  final BarometricPressure precipitationLastHour;
  final BarometricPressure precipitationLast3Hours;
  final BarometricPressure precipitationLast6Hours;
  final BarometricPressure relativeHumidity;
  final BarometricPressure windChill;
  final BarometricPressure heatIndex;
  final List<CloudLayer> cloudLayers;

  factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class BarometricPressure {
  BarometricPressure({
    required this.unitCode,
    required this.value,
    required this.qualityControl,
  });

  final String unitCode;
  final double? value;
  final String qualityControl;

  factory BarometricPressure.fromJson(Map<String, dynamic> json) => _$BarometricPressureFromJson(json);
  Map<String, dynamic> toJson() => _$BarometricPressureToJson(this);
}

@JsonSerializable()
class CloudLayer {
  CloudLayer({
    required this.base,
    required this.amount,
  });

  final Elevation base;
  final String amount;

  factory CloudLayer.fromJson(Map<String, dynamic> json) => _$CloudLayerFromJson(json);
  Map<String, dynamic> toJson() => _$CloudLayerToJson(this);
}

@JsonSerializable()
class Elevation {
  Elevation({
    required this.unitCode,
    required this.value,
  });

  final String unitCode;
  final int? value;

  factory Elevation.fromJson(Map<String, dynamic> json) => _$ElevationFromJson(json);
  Map<String, dynamic> toJson() => _$ElevationToJson(this);
}
