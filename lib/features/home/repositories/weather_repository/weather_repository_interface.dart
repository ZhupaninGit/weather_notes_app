import 'package:weather_notes_app/data/models/location.dart';

import '../../../../data/models/weather.dart';

abstract class WeatherRepositoryInterface {
  Future<Weather?> getWeather();
  Future<Weather?> getWeatherByCurrentLocation();
  Future<Weather?> getWeatherByChoosedLocation(Location location);
}
