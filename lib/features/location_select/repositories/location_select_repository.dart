import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_notes_app/data/models/location.dart';
import 'package:weather_notes_app/features/location_select/repositories/location_select_helper.dart';
import 'package:weather_notes_app/features/location_select/repositories/location_select_repository_interface.dart';
import 'package:http/http.dart' as http;

abstract class SharedPreferencesConstants {
  static const selectedLocation = "selected_location";
}

class LocationSelectRepository extends LocationSelectRepositoryInterface {
  static const String _baseUrl = "https://maps.googleapis.com/maps/api/place";
  static const String _placesAPIKey = String.fromEnvironment('PLACES_API_KEY');

  @override
  Future<List<Location>> getLocationsPrediction(String input) async {
    final Uri url = Uri.parse(
        "$_baseUrl/autocomplete/json?input=$input&key=$_placesAPIKey&language=en&types=(cities)");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to get locations. Try again later.");
    }

    final Map<String, dynamic> json = jsonDecode(response.body);
    final List<dynamic> listOfPredictions = json["predictions"];

    return listOfPredictions
        .map((prediction) => Location.fromAutoComplete(prediction))
        .toList();
  }

  @override
  Future<void> setSelectedLocation(Location location) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final locationWithCoordinates =
        await LocationSelectHelper.getPlaceCoordinates(location);
    log(locationWithCoordinates.toJson().toString());
    await sharedPreferences.setString(
      SharedPreferencesConstants.selectedLocation,
      jsonEncode(
        locationWithCoordinates.toJson(),
      ),
    );
  }

  @override
  Future<void> deleteSelectedLocation() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    log(SharedPreferencesConstants.selectedLocation);
    await sharedPreferences.remove(SharedPreferencesConstants.selectedLocation);
  }
}
