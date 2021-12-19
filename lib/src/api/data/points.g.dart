// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Points _$PointsFromJson(Map<String, dynamic> json) => Points(
      type: json['type'] as String,
      features: (json['features'] as List<dynamic>)
          .map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
      observationStations: (json['observationStations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PointsToJson(Points instance) => <String, dynamic>{
      'type': instance.type,
      'features': instance.features,
      'observationStations': instance.observationStations,
    };

ObservationStations _$ObservationStationsFromJson(Map<String, dynamic> json) =>
    ObservationStations(
      container: json['container'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ObservationStationsToJson(
        ObservationStations instance) =>
    <String, dynamic>{
      'container': instance.container,
      'type': instance.type,
    };

Value _$ValueFromJson(Map<String, dynamic> json) => Value(
      id: json['id'] as String,
    );

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
      'id': instance.id,
    };

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      id: json['id'] as String,
      type: json['type'] as String,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      properties:
          Properties.fromJson(json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'geometry': instance.geometry,
      'properties': instance.properties,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      id: json['@id'] as String,
      type: json['@type'] as String,
      elevation: Elevation.fromJson(json['elevation'] as Map<String, dynamic>),
      stationIdentifier: json['stationIdentifier'] as String,
      name: json['name'] as String,
      timeZone: json['timeZone'] as String,
      forecast: json['forecast'] as String,
      county: json['county'] as String,
      fireWeatherZone: json['fireWeatherZone'] as String,
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      '@id': instance.id,
      '@type': instance.type,
      'elevation': instance.elevation,
      'stationIdentifier': instance.stationIdentifier,
      'name': instance.name,
      'timeZone': instance.timeZone,
      'forecast': instance.forecast,
      'county': instance.county,
      'fireWeatherZone': instance.fireWeatherZone,
    };

Elevation _$ElevationFromJson(Map<String, dynamic> json) => Elevation(
      unitCode: json['unitCode'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$ElevationToJson(Elevation instance) => <String, dynamic>{
      'unitCode': instance.unitCode,
      'value': instance.value,
    };
