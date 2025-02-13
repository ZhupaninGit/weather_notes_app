import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_notes_app/domain/data_providers/current_location_data_provider.dart';
import 'package:weather_notes_app/domain/data_providers/weather_data_provider.dart';
import 'package:weather_notes_app/domain/models/failure.dart';
import 'package:weather_notes_app/domain/models/success.dart';
import 'package:weather_notes_app/domain/models/weather.dart';

class WeatherService {

  final CurrentLocationDataProvider _locationDataProvider = CurrentLocationDataProvider();
  final WeatherDataProvider _weatherDataProvider = WeatherDataProvider();

    Future<Either<Failure, Success>> getWeatherBySelectedLocation(double latitude,double longitude) async{
    try{
      final Weather currentWeather = await _getWeatherByLocation(latitude, longitude);
      return Right(Success(result: currentWeather));
    }
    catch(e){
      return Left(Failure(errorMessage:e.toString().replaceAll("Exception:", "")));
    }
  }

  Future<Either<Failure, Success>> getWeatherByCurrentLocation() async {
    try{
      final Position currentPosition = await _locationDataProvider.getCurrentLocation();
      final Weather currentWeather = await _getWeatherByLocation(currentPosition.latitude, currentPosition.longitude);
      return Right(Success(result: currentWeather));
    }
    catch(e){
      return Left(Failure(errorMessage:e.toString().replaceAll("Exception:", "")));
    }
  }

  Future<Weather> _getWeatherByLocation(double latitude,double longitude) async{
    try{
      final Weather currentWeather = await _weatherDataProvider.getWeatherByCoordinates(latitude,longitude);
      return currentWeather;
    }
    on ClientException{
      throw Exception("Failed to get current weather. Please,check your internet connection and try again.");
    }
    catch(e){
      throw Exception(e.toString().replaceAll("Exception:", ""));
    }
  }

}