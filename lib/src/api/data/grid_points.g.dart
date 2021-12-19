// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridPoints _$GridPointsFromJson(Map<String, dynamic> json) => GridPoints(
      id: json['id'] as String,
      type: json['type'] as String,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      properties: WelcomeProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GridPointsToJson(GridPoints instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'geometry': instance.geometry,
      'properties': instance.properties,
    };

CountyClass _$CountyClassFromJson(Map<String, dynamic> json) => CountyClass(
      type: json['type'] as String,
    );

Map<String, dynamic> _$CountyClassToJson(CountyClass instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

Distance _$DistanceFromJson(Map<String, dynamic> json) => Distance(
      id: json['id'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$DistanceToJson(Distance instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };

Value _$ValueFromJson(Map<String, dynamic> json) => Value(
      id: json['id'] as String,
    );

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
      'id': instance.id,
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

WelcomeProperties _$WelcomePropertiesFromJson(Map<String, dynamic> json) =>
    WelcomeProperties(
      id: json['@id'] as String,
      type: json['@type'] as String,
      cwa: json['cwa'] as String,
      forecastOffice: json['forecastOffice'] as String,
      gridId: json['gridId'] as String,
      gridX: json['gridX'] as int,
      gridY: json['gridY'] as int,
      forecast: json['forecast'] as String,
      forecastHourly: json['forecastHourly'] as String,
      forecastGridData: json['forecastGridData'] as String,
      observationStations: json['observationStations'] as String,
      relativeLocation: RelativeLocation.fromJson(
          json['relativeLocation'] as Map<String, dynamic>),
      forecastZone: json['forecastZone'] as String,
      county: json['county'] as String?,
      fireWeatherZone: json['fireWeatherZone'] as String?,
      timeZone: json['timeZone'] as String,
      radarStation: json['radarStation'] as String,
    );

Map<String, dynamic> _$WelcomePropertiesToJson(WelcomeProperties instance) =>
    <String, dynamic>{
      '@id': instance.id,
      '@type': instance.type,
      'cwa': instance.cwa,
      'forecastOffice': instance.forecastOffice,
      'gridId': instance.gridId,
      'gridX': instance.gridX,
      'gridY': instance.gridY,
      'forecast': instance.forecast,
      'forecastHourly': instance.forecastHourly,
      'forecastGridData': instance.forecastGridData,
      'observationStations': instance.observationStations,
      'relativeLocation': instance.relativeLocation,
      'forecastZone': instance.forecastZone,
      'county': instance.county,
      'fireWeatherZone': instance.fireWeatherZone,
      'timeZone': instance.timeZone,
      'radarStation': instance.radarStation,
    };

RelativeLocation _$RelativeLocationFromJson(Map<String, dynamic> json) =>
    RelativeLocation(
      type: json['type'] as String,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      properties: RelativeLocationProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RelativeLocationToJson(RelativeLocation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'geometry': instance.geometry,
      'properties': instance.properties,
    };

RelativeLocationProperties _$RelativeLocationPropertiesFromJson(
        Map<String, dynamic> json) =>
    RelativeLocationProperties(
      city: json['city'] as String,
      state: json['state'] as String,
      distance:
          DistanceClass.fromJson(json['distance'] as Map<String, dynamic>),
      bearing: DistanceClass.fromJson(json['bearing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RelativeLocationPropertiesToJson(
        RelativeLocationProperties instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'distance': instance.distance,
      'bearing': instance.bearing,
    };

DistanceClass _$DistanceClassFromJson(Map<String, dynamic> json) =>
    DistanceClass(
      unitCode: json['unitCode'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$DistanceClassToJson(DistanceClass instance) =>
    <String, dynamic>{
      'unitCode': instance.unitCode,
      'value': instance.value,
    };
