import 'package:flutter/material.dart';

  Icon _getCurrentWeatherIcon(String weather) {
    return switch (weather) {
      "Clear" => Icon(Icons.wb_sunny_outlined),
      "Clouds" => Icon(Icons.cloud_outlined),
      "Rain" => Icon(Icons.umbrella_outlined),
      "Snow" => Icon(Icons.ac_unit_outlined),
      "Thunderstorm" => Icon(Icons.flash_on_outlined),
      "Drizzle" => Icon(Icons.grain_outlined),
      "Mist" => Icon(Icons.foggy),
      _ => Icon(Icons.help_outline),
    };
  }

class Weather {
  String city;
  String weatherConditions;
  double temperature;
  int humidity;
  double windSpeed;
  Icon icon;

  Weather(
      {required this.city,
      required this.temperature,
      required this.humidity,
      required this.weatherConditions,
      required this.windSpeed,
      required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        city: json["name"],
        temperature: json["main"]["temp"],
        humidity: json["main"]["humidity"],
        weatherConditions: json["weather"][0]["main"],
        windSpeed: json["wind"]["speed"],
        icon: _getCurrentWeatherIcon(json["weather"][0]["main"]));
  }

}
