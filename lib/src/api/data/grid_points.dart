import 'package:json_annotation/json_annotation.dart';

part 'grid_points.g.dart';

@JsonSerializable()
class GridPoints {
  GridPoints({
    required this.id,
    required this.type,
    required this.geometry,
    required this.properties,
  });

  final String id;
  final String type;
  final Geometry geometry;
  final WelcomeProperties properties;

  factory GridPoints.fromJson(Map<String, dynamic> json) => _$GridPointsFromJson(json);
  Map<String, dynamic> toJson() => _$GridPointsToJson(this);
}

@JsonSerializable()
class CountyClass {
  CountyClass({
    required this.type,
  });

  final String type;

  factory CountyClass.fromJson(Map<String, dynamic> json) => _$CountyClassFromJson(json);
  Map<String, dynamic> toJson() => _$CountyClassToJson(this);
}

@JsonSerializable()
class Distance {
  Distance({
    required this.id,
    required this.type,
  });

  final String id;
  final String type;

  factory Distance.fromJson(Map<String, dynamic> json) => _$DistanceFromJson(json);
  Map<String, dynamic> toJson() => _$DistanceToJson(this);
}

@JsonSerializable()
class Value {
  Value({
    required this.id,
  });

  final String id;

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
  Map<String, dynamic> toJson() => _$ValueToJson(this);
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
class WelcomeProperties {
  WelcomeProperties({
    required this.id,
    required this.type,
    required this.cwa,
    required this.forecastOffice,
    required this.gridId,
    required this.gridX,
    required this.gridY,
    required this.forecast,
    required this.forecastHourly,
    required this.forecastGridData,
    required this.observationStations,
    required this.relativeLocation,
    required this.forecastZone,
    required this.county,
    required this.fireWeatherZone,
    required this.timeZone,
    required this.radarStation,
  });

  @JsonKey(name: '@id')
  String id;
  @JsonKey(name: '@type')
  String type;
  final String cwa;
  final String forecastOffice;
  final String gridId;
  final int gridX;
  final int gridY;
  final String forecast;
  final String forecastHourly;
  final String forecastGridData;
  final String observationStations;
  final RelativeLocation relativeLocation;
  final String forecastZone;
  final String? county;
  final String? fireWeatherZone;
  final String timeZone;
  final String radarStation;

  factory WelcomeProperties.fromJson(Map<String, dynamic> json) => _$WelcomePropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$WelcomePropertiesToJson(this);
}

@JsonSerializable()
class RelativeLocation {
  RelativeLocation({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  final String type;
  final Geometry geometry;
  final RelativeLocationProperties properties;

  factory RelativeLocation.fromJson(Map<String, dynamic> json) => _$RelativeLocationFromJson(json);
  Map<String, dynamic> toJson() => _$RelativeLocationToJson(this);
}

@JsonSerializable()
class RelativeLocationProperties {
  RelativeLocationProperties({
    required this.city,
    required this.state,
    required this.distance,
    required this.bearing,
  });

  final String city;
  final String state;
  final DistanceClass distance;
  final DistanceClass bearing;

  factory RelativeLocationProperties.fromJson(Map<String, dynamic> json) => _$RelativeLocationPropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$RelativeLocationPropertiesToJson(this);
}

@JsonSerializable()
class DistanceClass {
  DistanceClass({
    required this.unitCode,
    required this.value,
  });

  final String unitCode;
  final double value;

  factory DistanceClass.fromJson(Map<String, dynamic> json) => _$DistanceClassFromJson(json);
  Map<String, dynamic> toJson() => _$DistanceClassToJson(this);
}
