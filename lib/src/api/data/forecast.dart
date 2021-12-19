import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  Forecast({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  final String type;
  final Geometry geometry;
  final Properties properties;

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  final String type;
  final List<List<List<double>>> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Properties {
  Properties({
    required this.updated,
    required this.units,
    required this.forecastGenerator,
    required this.generatedAt,
    required this.updateTime,
    required this.validTimes,
    required this.elevation,
    required this.periods,
  });

  final DateTime updated;
  final String units;
  final String forecastGenerator;
  final DateTime generatedAt;
  final DateTime updateTime;
  final String validTimes;
  final Elevation elevation;
  final List<Period> periods;

  factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class Elevation {
  Elevation({
    required this.unitCode,
    required this.value,
  });

  final String unitCode;
  final double value;

  factory Elevation.fromJson(Map<String, dynamic> json) => _$ElevationFromJson(json);
  Map<String, dynamic> toJson() => _$ElevationToJson(this);
}

@JsonSerializable()
class Period {
  Period({
    required this.number,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.isDaytime,
    required this.temperature,
    required this.temperatureUnit,
    required this.temperatureTrend,
    required this.windSpeed,
    required this.windDirection,
    required this.icon,
    required this.shortForecast,
    required this.detailedForecast,
  });

  final int number;
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final bool isDaytime;
  final int temperature;
  final String temperatureUnit;
  final dynamic temperatureTrend;
  final String windSpeed;
  final String windDirection;
  final String icon;
  final String shortForecast;
  final String detailedForecast;

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);
  Map<String, dynamic> toJson() => _$PeriodToJson(this);
}
