import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_notes_app/data/models/location.dart';
import 'package:weather_notes_app/data/models/weather.dart';
import 'package:weather_notes_app/features/home/repositories/weather_repository/weather_helper.dart';
import 'package:weather_notes_app/features/home/repositories/weather_repository/weather_repository_interface.dart';

class WeatherRepository extends WeatherRepositoryInterface {
  @override
  Future<Weather?> getWeather() async {
    final location = await WeatherHelper.getSelectedLocation();
    if (location == null) {
      return await getWeatherByCurrentLocation();
    } else {
      final weather = await getWeatherByChoosedLocation(location);
      return weather!.copyWith(city: location.description);
    }
  }

  @override
  Future<Weather?> getWeatherByChoosedLocation(Location location) async {
    try {
      final weather = await WeatherHelper.getWeatherByCoordinates(
        location.latitude!,
        location.longitude!,
      );
      return weather;
    } catch (e) {
      throw WeatherException(e.toString());
    }
  }

  @override
  Future<Weather> getWeatherByCurrentLocation() async {
    try {
      final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        throw WeatherException(
            "Location service is turned off.Please,turn it on and try again");
      }
      await WeatherHelper.checkAndRequestLocationPermissions();

      final currentPosition = await Geolocator.getCurrentPosition();

      final weather = await WeatherHelper.getWeatherByCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      return weather;
    } on ClientException {
      throw WeatherException(
          "Some error occured.Please,check your internet connection.");
    } catch (e) {
      throw WeatherException(e.toString());
    }
  }
}

class WeatherException {
  final String errorMessage;

  WeatherException(this.errorMessage);

  @override
  String toString() => errorMessage;
}
