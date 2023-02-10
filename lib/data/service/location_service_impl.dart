import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/domain/service/location_service.dart';


class LocationServiceImpl extends LocationService {
  @override
  Future<LatLng> fetchLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    return LatLng(position.latitude, position.longitude);
  }
}