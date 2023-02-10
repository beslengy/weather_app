import 'package:weather_app/domain/models/weather_model.dart';

abstract class WeatherService {
  Future<WeatherModel?> fetchWeather({required double lat, required double lng});
}