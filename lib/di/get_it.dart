import 'package:get_it/get_it.dart';
import 'package:weather_app/data/service/location_service_impl.dart';
import 'package:weather_app/data/service/weather_service_impl.dart';
import 'package:weather_app/domain/service/location_service.dart';
import 'package:weather_app/domain/service/suggestions_service.dart';
import 'package:weather_app/domain/service/weather_service.dart';

GetIt getIt = GetIt.instance;

initLocator() {
  getIt.registerSingleton<LocationService>(LocationServiceImpl());
  getIt.registerSingleton<WeatherService>(WeatherServiceImpl());
  getIt.registerSingleton<SuggestionService>(SuggestionService()..init());
}