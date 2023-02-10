import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/domain/models/weather_model.dart';

import '../../domain/service/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService = GetIt.I<WeatherService>();

  WeatherCubit() : super(const WeatherState(status: WeatherStatus.initial, weather: null));

  Future<void> fetchInitial() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      emit(state.copyWith(status: WeatherStatus.loading));

      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        WeatherModel? model = await weatherService.fetchWeather(
            lat: position.latitude, lng: position.longitude);
        if (model != null) {
          emit(state.copyWith(status: WeatherStatus.ready, weather: model));
        } else {
          emit(state.copyWith(status: WeatherStatus.error));
        }
      } on Error catch (error) {
        emit(state.copyWith(status: WeatherStatus.error));
      }
    }
  }

  Future<void> fetchByParams(LatLng latLng) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      WeatherModel? model = await weatherService.fetchWeather(
          lat: latLng.latitude, lng: latLng.longitude);
      if (model != null) {
        emit(state.copyWith(status: WeatherStatus.ready, weather: model));
      } else {
        emit(state.copyWith(status: WeatherStatus.error));
      }
    } catch (error) {
      emit(state.copyWith(status: WeatherStatus.error));
    }
  }
}
