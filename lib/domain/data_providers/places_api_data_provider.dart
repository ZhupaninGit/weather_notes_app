import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/location.dart';

class PlacesApiDataProvider {
  static const String _baseUrl = "https://maps.googleapis.com/maps/api/place";
  static const String _placesAPIKey = String.fromEnvironment('PLACES_API_KEY');
  
  Future<List<Location>> getLocationPredictionBasedOnUserInput(String input) async {
    final Uri url = Uri.parse("$_baseUrl/autocomplete/json?input=$input&key=$_placesAPIKey&language=en&types=(cities)");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to get locations. Try again later.");
    }

    final Map<String, dynamic> json = jsonDecode(response.body);
    final List<dynamic> listOfPredictions = json["predictions"];

    return listOfPredictions.map((prediction) => Location.fromAutoComplete(prediction)).toList();
  }

  Future<Location> getPlaceCoordinates(Location place) async {
    final Uri url = Uri.parse("$_baseUrl/details/json?place_id=${place.placeId}&key=$_placesAPIKey");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to get locations. Try again later.");
    }

    final Map<String, dynamic> json = jsonDecode(response.body)["result"]["geometry"]["location"];
    final double latitude = json["lat"];
    final double longitude = json["lng"];

    return place.copyWith(latitude: latitude, longitude: longitude);
  }
}
