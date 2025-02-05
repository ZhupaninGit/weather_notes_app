import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_notes_app/domain/models/weather.dart';

class WeatherDataProvider {
  static const _baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  static const _openWeatherApiKey = String.fromEnvironment('WEATHER_API_KEY');

  Future<Weather> getCurrentWeather(Position position) async{
    final url = Uri.parse("$_baseUrl?lat=${position.latitude}&lon=${position.longitude}&appid=$_openWeatherApiKey&units=metric");

    final response = await http.get(url);

    if(response.statusCode != 200){
      throw Exception("Failed to get current weather.Try again later.");
    }

    final json = jsonDecode(response.body);
    return Weather.fromJson(json);

  }


}