import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'package:flutter_weather/src/api/data/grid_points.dart';
import 'package:http/http.dart' as http;

import 'data/forecast.dart';
import 'data/observations.dart';
import 'data/points.dart';

class NWS {
  static const baseURL = 'https://api.weather.gov';

  Future<Points> points({required double latitude, required double longitude}) async {
    final response = await http.get(Uri.parse('$baseURL/points/$latitude,$longitude/stations'));
    // if (kDebugMode) print(response.body);
    final map = jsonDecode(response.body);
    return Points.fromJson(map);
  }

  Future<Observations> observations({required String stationIdentifier}) async {
    final response = await http.get(Uri.parse('$baseURL/stations/$stationIdentifier/observations/latest?require_qc=false'));
    // if (kDebugMode) print(response.body);
    final map = jsonDecode(response.body);
    return Observations.fromJson(map);
  }

  Future<GridPoints> gridPoints({required double latitude, required double longitude}) async {
    final response = await http.get(Uri.parse('$baseURL/points/$latitude,$longitude'));
    // if (kDebugMode) print(response.body);
    final map = jsonDecode(response.body);
    return GridPoints.fromJson(map);
  }

  Future<Forecast> forecast({required String wfo, required int x, required int y}) async {
    final response = await http.get(Uri.parse('$baseURL/gridpoints/$wfo/$x,$y/forecast'));
    // if (kDebugMode) print(response.body);
    final map = jsonDecode(response.body);
    return Forecast.fromJson(map);
  }
}
