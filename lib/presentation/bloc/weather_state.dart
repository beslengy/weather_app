part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, ready, error }

class WeatherState extends Equatable {
  final WeatherStatus status;
  final WeatherModel? weather;

  const WeatherState({required this.status, required this.weather});

  @override
  List<Object?> get props => [weather, status];

  WeatherState copyWith({
    WeatherModel? weather,
    WeatherStatus? status,
  }) {
    return WeatherState(status: status ?? this.status, weather: weather ?? this.weather);
  }
}
