import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    required String city,
    required String weatherConditions,
    required double temperature,
    required num humidity,
    required double windSpeed,
    required Icon icon
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        city: json["name"],
        temperature: json["main"]["temp"],
        humidity: json["main"]["humidity"],
        weatherConditions: json["weather"][0]["main"],
        windSpeed: json["wind"]["speed"],
        icon: getCurrentWeatherIcon(json["weather"][0]["main"]));
  }
}

Icon getCurrentWeatherIcon(String weather) {
  return switch (weather) {
    "Clear" => Icon(Icons.wb_sunny_outlined),
    "Clouds" => Icon(Icons.cloud_outlined),
    "Rain" => Icon(Icons.umbrella_outlined),
    "Snow" => Icon(Icons.ac_unit_outlined),
    "Thunderstorm" => Icon(Icons.flash_on_outlined),
    "Drizzle" => Icon(Icons.grain_outlined),
    "Mist" => Icon(Icons.foggy),
    "Haze" => Icon(Icons.dirty_lens),
    "Fog" => Icon(Icons.foggy),
    _ => Icon(Icons.help_outline),
  };
}



// class Weather {
//   String city;
//   String weatherConditions;
//   double temperature;
//   num humidity;
//   double windSpeed;
//   Icon icon;

//   Weather(
//       {required this.city,
//       required this.temperature,
//       required this.humidity,
//       required this.weatherConditions,
//       required this.windSpeed,
//       required this.icon});

//   factory Weather.fromJson(Map<String, dynamic> json) {
//     return Weather(
//         city: json["name"],
//         temperature: json["main"]["temp"],
//         humidity: json["main"]["humidity"],
//         weatherConditions: json["weather"][0]["main"],
//         windSpeed: json["wind"]["speed"],
//         icon: _getCurrentWeatherIcon(json["weather"][0]["main"]));
//   }
// }