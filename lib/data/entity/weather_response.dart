import 'package:json_annotation/json_annotation.dart';
part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  final List<Weather> weather;
  @JsonKey(name: "main")
  final MainInfo mainInfo;
  final Wind wind;
  @JsonKey(name: "name")
  final String region;
  final int visibility;

  WeatherResponse(this.weather, this.mainInfo, this.wind, this.region, this.visibility);

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

}
@JsonSerializable()
class MainInfo {
  final double temp;  // 298.48,
  @JsonKey(name: "feels_like")
  final double feelsLike;  // 298.74,
  @JsonKey(name: "temp_min")
  final double tempMin;  // 297.56,
  @JsonKey(name: "temp_max")
  final double tempMax;  // 300.05,
  final int pressure;  // 1015,
  final int humidity;// 64,
  @JsonKey(name: "sea_level")
  final double? seaLevel;  // 1015,
  @JsonKey(name: "grnd_level")
  final double? groundLevel; // 933

  MainInfo(this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure,
      this.humidity, this.seaLevel, this.groundLevel);

  factory MainInfo.fromJson(Map<String, dynamic> json) => _$MainInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MainInfoToJson(this);
}
@JsonSerializable()
class Weather {
  final int id; // 501,
  final String main; // "Rain",
  final String description; // "moderate rain",
  final String icon; // "10d"

  Weather(this.id, this.main, this.description, this.icon);

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
@JsonSerializable()
class Wind {
  final double speed; // 0.62,
  final int deg; // 349,
  final double? gust; // 1.18

  Wind(this.speed, this.deg, this.gust);

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
}
