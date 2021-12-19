// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Observations _$ObservationsFromJson(Map<String, dynamic> json) => Observations(
      id: json['id'] as String,
      type: json['type'] as String,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      properties:
          Properties.fromJson(json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ObservationsToJson(Observations instance) =>
    <String, dynamic>{
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
      station: json['station'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      rawMessage: json['rawMessage'] as String,
      textDescription: json['textDescription'] as String,
      icon: json['icon'] as String,
      presentWeather: json['presentWeather'] as List<dynamic>,
      temperature: BarometricPressure.fromJson(
          json['temperature'] as Map<String, dynamic>),
      dewpoint:
          BarometricPressure.fromJson(json['dewpoint'] as Map<String, dynamic>),
      windDirection: BarometricPressure.fromJson(
          json['windDirection'] as Map<String, dynamic>),
      windSpeed: BarometricPressure.fromJson(
          json['windSpeed'] as Map<String, dynamic>),
      windGust:
          BarometricPressure.fromJson(json['windGust'] as Map<String, dynamic>),
      barometricPressure: BarometricPressure.fromJson(
          json['barometricPressure'] as Map<String, dynamic>),
      seaLevelPressure: BarometricPressure.fromJson(
          json['seaLevelPressure'] as Map<String, dynamic>),
      visibility: BarometricPressure.fromJson(
          json['visibility'] as Map<String, dynamic>),
      maxTemperatureLast24Hours: Elevation.fromJson(
          json['maxTemperatureLast24Hours'] as Map<String, dynamic>),
      minTemperatureLast24Hours: Elevation.fromJson(
          json['minTemperatureLast24Hours'] as Map<String, dynamic>),
      precipitationLastHour: BarometricPressure.fromJson(
          json['precipitationLastHour'] as Map<String, dynamic>),
      precipitationLast3Hours: BarometricPressure.fromJson(
          json['precipitationLast3Hours'] as Map<String, dynamic>),
      precipitationLast6Hours: BarometricPressure.fromJson(
          json['precipitationLast6Hours'] as Map<String, dynamic>),
      relativeHumidity: BarometricPressure.fromJson(
          json['relativeHumidity'] as Map<String, dynamic>),
      windChill: BarometricPressure.fromJson(
          json['windChill'] as Map<String, dynamic>),
      heatIndex: BarometricPressure.fromJson(
          json['heatIndex'] as Map<String, dynamic>),
      cloudLayers: (json['cloudLayers'] as List<dynamic>)
          .map((e) => CloudLayer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      '@id': instance.id,
      '@type': instance.type,
      'elevation': instance.elevation,
      'station': instance.station,
      'timestamp': instance.timestamp.toIso8601String(),
      'rawMessage': instance.rawMessage,
      'textDescription': instance.textDescription,
      'icon': instance.icon,
      'presentWeather': instance.presentWeather,
      'temperature': instance.temperature,
      'dewpoint': instance.dewpoint,
      'windDirection': instance.windDirection,
      'windSpeed': instance.windSpeed,
      'windGust': instance.windGust,
      'barometricPressure': instance.barometricPressure,
      'seaLevelPressure': instance.seaLevelPressure,
      'visibility': instance.visibility,
      'maxTemperatureLast24Hours': instance.maxTemperatureLast24Hours,
      'minTemperatureLast24Hours': instance.minTemperatureLast24Hours,
      'precipitationLastHour': instance.precipitationLastHour,
      'precipitationLast3Hours': instance.precipitationLast3Hours,
      'precipitationLast6Hours': instance.precipitationLast6Hours,
      'relativeHumidity': instance.relativeHumidity,
      'windChill': instance.windChill,
      'heatIndex': instance.heatIndex,
      'cloudLayers': instance.cloudLayers,
    };

BarometricPressure _$BarometricPressureFromJson(Map<String, dynamic> json) =>
    BarometricPressure(
      unitCode: json['unitCode'] as String,
      value: (json['value'] as num?)?.toDouble(),
      qualityControl: json['qualityControl'] as String,
    );

Map<String, dynamic> _$BarometricPressureToJson(BarometricPressure instance) =>
    <String, dynamic>{
      'unitCode': instance.unitCode,
      'value': instance.value,
      'qualityControl': instance.qualityControl,
    };

CloudLayer _$CloudLayerFromJson(Map<String, dynamic> json) => CloudLayer(
      base: Elevation.fromJson(json['base'] as Map<String, dynamic>),
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$CloudLayerToJson(CloudLayer instance) =>
    <String, dynamic>{
      'base': instance.base,
      'amount': instance.amount,
    };

Elevation _$ElevationFromJson(Map<String, dynamic> json) => Elevation(
      unitCode: json['unitCode'] as String,
      value: json['value'] as int?,
    );

Map<String, dynamic> _$ElevationToJson(Elevation instance) => <String, dynamic>{
      'unitCode': instance.unitCode,
      'value': instance.value,
    };
