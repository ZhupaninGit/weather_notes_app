import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:weather_notes_app/domain/data_providers/places_api_data_provider.dart';
import 'package:weather_notes_app/domain/models/failure.dart';
import 'package:weather_notes_app/domain/models/location.dart';
import 'package:weather_notes_app/domain/models/success.dart';

class LocationService {
  final PlacesApiDataProvider _placesApiDataProvider = PlacesApiDataProvider();

  Future<Either<Failure, Success>> getLocationPrediction(String input) async {
    try {
      final List<Location> locations = await _placesApiDataProvider.getLocationPredictionBasedOnUserInput(input);
      return Right(Success(result: locations));
    } on ClientException {
      return Left(Failure(errorMessage: "Some error occurred. Please check your internet connection and try again."));
    } catch (e) {
      return Left(Failure(errorMessage: e.toString().replaceAll("Exception:", "")));
    }
  }

  Future<Either<Failure, Success>> getLocationCoordinates(Location inputLocation) async {
    try {
      final Location location = await _placesApiDataProvider.getPlaceCoordinates(inputLocation);
      return Right(Success(result: location));
    } on ClientException {
      return Left(Failure(errorMessage: "Some error occurred. Please check your internet connection and try again."));
    } catch (e) {
      return Left(Failure(errorMessage: e.toString().replaceAll("Exception:", "")));
    }
  }
}
