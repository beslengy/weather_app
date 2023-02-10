// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      MainInfo.fromJson(json['main'] as Map<String, dynamic>),
      Wind.fromJson(json['wind'] as Map<String, dynamic>),
      json['name'] as String,
      json['visibility'] as int,
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.mainInfo,
      'wind': instance.wind,
      'name': instance.region,
      'visibility': instance.visibility,
    };

MainInfo _$MainInfoFromJson(Map<String, dynamic> json) => MainInfo(
      (json['temp'] as num).toDouble(),
      (json['feels_like'] as num).toDouble(),
      (json['temp_min'] as num).toDouble(),
      (json['temp_max'] as num).toDouble(),
      json['pressure'] as int,
      json['humidity'] as int,
      (json['sea_level'] as num?)?.toDouble(),
      (json['grnd_level'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MainInfoToJson(MainInfo instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.groundLevel,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      json['id'] as int,
      json['main'] as String,
      json['description'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
      (json['speed'] as num).toDouble(),
      json['deg'] as int,
      (json['gust'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
