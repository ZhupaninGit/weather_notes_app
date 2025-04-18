import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_notes_app/data/models/location.dart';

import '../../../../data/models/weather.dart';
import 'package:http/http.dart' as http;

abstract class SharedPreferencesConstants {
  static const selectedLocation = "selected_location";
}

abstract class WeatherHelper {
  static const _baseWeatherAPIUrl = "https://api.openweathermap.org/data/2.5/weather";
  static const _openWeatherApiKey = String.fromEnvironment('WEATHER_API_KEY');

  static Future<Weather> getWeatherByCoordinates(
      double latitude, double longitude) async {
    final url = Uri.parse(
        "$_baseWeatherAPIUrl?lat=$latitude&lon=$longitude&appid=$_openWeatherApiKey&units=metric");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("Failed to get current weather.Try again later.");
    }
    final json = jsonDecode(response.body);
    return Weather.fromJson(json);
  }

    static Future<void> checkAndRequestLocationPermissions() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      throw PermissionDeniedException(
          "You must provide your location to proceed.");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        throw PermissionDeniedException(
            "You must enable location permission in the app settings and try again.");
      } else if (locationPermission == LocationPermission.denied) {
        throw PermissionDeniedException(
            "You must provide your location to proceed.");
      }
    }
  }

  static Future<Location?> getSelectedLocation() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonLocation = sharedPreferences
        .getString(SharedPreferencesConstants.selectedLocation);
    if (jsonLocation == null) {
      return null;
    }
    final result = Location.fromJson(jsonDecode(jsonLocation));
    return result;
  }

}
