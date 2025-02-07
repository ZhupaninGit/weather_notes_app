import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_notes_app/domain/data_providers/location_data_provider.dart';
import 'package:weather_notes_app/domain/data_providers/weather_data_provider.dart';
import 'package:weather_notes_app/domain/models/failure.dart';
import 'package:weather_notes_app/domain/models/success.dart';
import 'package:weather_notes_app/domain/models/weather.dart';

class WeatherService {

  final LocationDataProvider _locationDataProvider = LocationDataProvider();
  final WeatherDataProvider _weatherDataProvider = WeatherDataProvider();

  Future<Either<Failure, Success>> getCurrentWeather() async{
    try{
      final Position currentPosition = await _locationDataProvider.getCurrentPosition();
      final Weather currentWeahter = await _weatherDataProvider.getCurrentWeather(currentPosition);
      return Right(Success(result: currentWeahter));
    }
    on ClientException{
      return Left(Failure(errorMessage: "Failed to get current weather. Please,check your internet connection and try again."));
    }
    catch(e){
      return Left(Failure(errorMessage:e.toString().replaceAll("Exception:", "")));
    }
  }

}