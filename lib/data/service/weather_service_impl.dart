import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/mapper/weather_mapper.dart';
import 'package:weather_app/domain/models/weather_model.dart';
import 'package:weather_app/domain/service/weather_service.dart';

import '../entity/weather_response.dart';

class WeatherServiceImpl extends WeatherService {
  static const String _url = "api.openweathermap.org";
  static const String _weatherPath = "/data/2.5/weather";
  static const String _apiKey = "b814c2531fe033df22517c3cdab4aa3c";

  // WeatherService._privateConstructor();
  // static final WeatherService instance = WeatherService._privateConstructor();

  @override
  Future<WeatherModel?> fetchWeather(
      {required double lat, required double lng}) async {
    http.Response response;
    response = await http.get(Uri.https(_url, _weatherPath, {
      "units": "metric",
      "appid": _apiKey,
      "lat": lat.toString(),
      "lon": lng.toString(),
    }));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      return WeatherResponse.fromJson(data).toDomain();
    } else {
      return null;
    }
  }
}
