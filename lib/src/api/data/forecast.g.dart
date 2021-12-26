// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      type: json['type'] as String,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'type': instance.type,
      'geometry': instance.geometry,
      'properties': instance.properties,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList())
          .toList(),
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      updated: DateTime.parse(json['updated'] as String),
      units: json['units'] as String,
      forecastGenerator: json['forecastGenerator'] as String,
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      updateTime: DateTime.parse(json['updateTime'] as String),
      validTimes: json['validTimes'] as String,
      elevation: Elevation.fromJson(json['elevation'] as Map<String, dynamic>),
      periods: (json['periods'] as List<dynamic>)
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'updated': instance.updated.toIso8601String(),
      'units': instance.units,
      'forecastGenerator': instance.forecastGenerator,
      'generatedAt': instance.generatedAt.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
      'validTimes': instance.validTimes,
      'elevation': instance.elevation,
      'periods': instance.periods,
    };

Elevation _$ElevationFromJson(Map<String, dynamic> json) => Elevation(
      unitCode: json['unitCode'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$ElevationToJson(Elevation instance) => <String, dynamic>{
      'unitCode': instance.unitCode,
      'value': instance.value,
    };

Period _$PeriodFromJson(Map<String, dynamic> json) => Period(
      number: json['number'] as int,
      name: json['name'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      isDaytime: json['isDaytime'] as bool,
      temperature: json['temperature'] as int,
      temperatureUnit: json['temperatureUnit'] as String,
      temperatureTrend: json['temperatureTrend'],
      windSpeed: json['windSpeed'] as String,
      windDirection: json['windDirection'] as String,
      icon: json['icon'] as String,
      shortForecast: json['shortForecast'] as String,
      detailedForecast: json['detailedForecast'] as String,
    );

Map<String, dynamic> _$PeriodToJson(Period instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'isDaytime': instance.isDaytime,
      'temperature': instance.temperature,
      'temperatureUnit': instance.temperatureUnit,
      'temperatureTrend': instance.temperatureTrend,
      'windSpeed': instance.windSpeed,
      'windDirection': instance.windDirection,
      'icon': instance.icon,
      'shortForecast': instance.shortForecast,
      'detailedForecast': instance.detailedForecast,
    };
