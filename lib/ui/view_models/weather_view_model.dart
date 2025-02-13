import 'package:flutter/foundation.dart';
import 'package:weather_notes_app/domain/models/location.dart';
import 'package:weather_notes_app/domain/models/weather.dart';
import 'package:weather_notes_app/domain/services/shared_preferences_service.dart';
import 'package:weather_notes_app/domain/services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherViewModel() {
    updateWeather();
  }

  final WeatherService _weatherService = WeatherService();
  final SharedPreferencesService _preferencesService =
      SharedPreferencesService();

  Weather? _currentWeather;
  String? _errorMessage;
  Location? _selectedLocation;

  Weather? get currentWeather => _currentWeather;
  String? get errorMessage => _errorMessage;
  Location? get selectedLocation => _selectedLocation;

  void updateWeather() async {
    final location = await _preferencesService.getSelectedLocation();
    if (location == null) {
      await getCurrentWeatherByCurrentLocation();
    } else {
      _selectedLocation = location;
      await getCurrentWeatherBySelectedLocation();
    }
  }

  void setSelectedLocation(Location place) {
    _selectedLocation = place;
    _currentWeather = null;
    notifyListeners();
    getCurrentWeatherBySelectedLocation();
  }

  void deleteSelectedLocation() {
    _selectedLocation = null;
    _currentWeather = null;
    notifyListeners();
    getCurrentWeatherByCurrentLocation();
  }

  Future<void> getCurrentWeatherBySelectedLocation() async {
    _errorMessage = null;
    notifyListeners();

    final result = await _weatherService.getWeatherBySelectedLocation(
        selectedLocation!.latitude!, selectedLocation!.longitude!);
    result.fold(
      (error) => _errorMessage = error.errorMessage,
      (success) {
        _currentWeather = success.result as Weather;
        _currentWeather!.city = selectedLocation!.description.split(',')[0];
      },
    );
    notifyListeners();
  }

  Future<void> getCurrentWeatherByCurrentLocation() async {
    _errorMessage = null;
    notifyListeners();

    final result = await _weatherService.getWeatherByCurrentLocation();
    result.fold(
      (error) => _errorMessage = error.errorMessage,
      (success) => _currentWeather = success.result as Weather,
    );
    notifyListeners();
  }
}
