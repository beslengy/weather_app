class WeatherModel {
  final String region;
  final int temp;
  final int feelsLike;
  final String imageLink;
  final double windSpeed;
  final String? windDirection;
  final String weather;
  final String weatherDetail;
  final int pressure;

  WeatherModel({
    required this.region,
    required this.temp,
    required this.feelsLike,
    required this.imageLink,
    required this.windSpeed,
    required this.windDirection,
    required this.weather,
    required this.weatherDetail,
    required this.pressure,
  });
}
