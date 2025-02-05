import 'package:flutter/foundation.dart';
import 'package:weather_notes_app/domain/models/weather.dart';
import 'package:weather_notes_app/domain/services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherViewModel() {
    getCurrentWeather();
  }

  final WeatherService _weatherService = WeatherService();

  Weather? _currentWeather;
  String? _errorMessage;

  Weather? get currentWeather => _currentWeather;
  String? get errorMessage => _errorMessage;

  Future<void> getCurrentWeather() async {
    _errorMessage = null;
    notifyListeners();

    final result = await _weatherService.getCurrentWeather();
    result.fold(
      (error) {
        _errorMessage = error.errorMessage;
      },
      (success) {
        _currentWeather = success.result as Weather;
      },
    );
    notifyListeners();
  }
}
