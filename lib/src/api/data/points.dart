import 'package:json_annotation/json_annotation.dart';

part 'points.g.dart';

@JsonSerializable()
class Points {
  Points({
    required this.type,
    required this.features,
    required this.observationStations,
  });

  String type;
  List<Feature> features;
  List<String> observationStations;

  factory Points.fromJson(Map<String, dynamic> json) => _$PointsFromJson(json);
  Map<String, dynamic> toJson() => _$PointsToJson(this);
}

@JsonSerializable()
class ObservationStations {
  ObservationStations({
    required this.container,
    required this.type,
  });

  String container;
  String type;

  factory ObservationStations.fromJson(Map<String, dynamic> json) => _$ObservationStationsFromJson(json);
  Map<String, dynamic> toJson() => _$ObservationStationsToJson(this);
}

@JsonSerializable()
class Value {
  Value({
    required this.id,
  });

  String id;

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
  Map<String, dynamic> toJson() => _$ValueToJson(this);
}

@JsonSerializable()
class Feature {
  Feature({
    required this.id,
    required this.type,
    required this.geometry,
    required this.properties,
  });

  String id;
  String type;
  Geometry geometry;
  Properties properties;

  factory Feature.fromJson(Map<String, dynamic> json) => _$FeatureFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureToJson(this);
}

@JsonSerializable()
class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Properties {
  Properties({
    required this.id,
    required this.type,
    required this.elevation,
    required this.stationIdentifier,
    required this.name,
    required this.timeZone,
    required this.forecast,
    required this.county,
    required this.fireWeatherZone,
  });

  @JsonKey(name: '@id')
  String id;
  @JsonKey(name: '@type')
  String type;
  Elevation elevation;
  String stationIdentifier;
  String name;
  String timeZone;
  String forecast;
  String county;
  String fireWeatherZone;

  factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class Elevation {
  Elevation({
    required this.unitCode,
    required this.value,
  });

  String unitCode;
  double value;

  factory Elevation.fromJson(Map<String, dynamic> json) => _$ElevationFromJson(json);
  Map<String, dynamic> toJson() => _$ElevationToJson(this);
}
