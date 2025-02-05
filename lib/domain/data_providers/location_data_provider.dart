import 'package:geolocator/geolocator.dart';

class LocationDataProvider {
  Future<Position> getCurrentPosition() async {
    await _checkPermissions();
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _checkPermissions() async {
    final bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      throw Exception(
          "Location services are disabled. Please enable them and try again.");
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      throw Exception(
          "Location permission is denied forever.You must enable location permission in the app settings and try again.");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        throw Exception(
            "You must enable location permission in the app settings and try again.");
      } else if (locationPermission == LocationPermission.denied) {
        throw Exception("You must provide your location to proceed.");
      }
    }
  }
}
