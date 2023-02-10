import 'package:latlong2/latlong.dart';

abstract class LocationService {
  Future<LatLng> fetchLocation();
}