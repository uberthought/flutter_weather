import 'package:flutter_weather/src/api/data/forecast.dart';

extension PeriodExtensions on Period {
  double get temperatureC => (temperature.toDouble() - 32.0) * 5.0 / 9.0;
}
