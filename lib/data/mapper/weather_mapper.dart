import 'package:weather_app/data/entity/weather_response.dart';
import 'package:weather_app/domain/models/weather_model.dart';
import 'package:weather_app/domain/utils/wind_direction_parser.dart';

extension WeatherMapper on WeatherResponse {
  static String _getImageLink(String imageId) => "https://openweathermap.org/img/wn/$imageId@2x.png";

  WeatherModel toDomain() {
    var w = weather.first;
    return WeatherModel(
      region: region,
      temp: mainInfo.temp.round(),
      feelsLike: mainInfo.feelsLike.round(),
      imageLink: _getImageLink(w.icon),
      windSpeed: wind.speed,
      windDirection: WindDirection.findByDegrees(wind.deg)?.name,
      weather: w.main,
      weatherDetail: w.description,
      pressure: (mainInfo.pressure / 1.333).floor(),
    );
  }
}
