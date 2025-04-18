import 'dart:convert';

import '../../../data/models/location.dart';
import 'package:http/http.dart' as http;

abstract class LocationSelectHelper {

  static const String _basePlacesAPIUrl =
      "https://maps.googleapis.com/maps/api/place";
  static const String _placesAPIKey = String.fromEnvironment('PLACES_API_KEY');

  static Future<Location> getPlaceCoordinates(Location location) async {
    final Uri url = Uri.parse(
        "$_basePlacesAPIUrl/details/json?place_id=${location.placeId}&key=$_placesAPIKey");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to get locations. Try again later.");
    }

    final Map<String, dynamic> json =
        jsonDecode(response.body)["result"]["geometry"]["location"];
    final double latitude = json["lat"];
    final double longitude = json["lng"];

    return location.copyWith(latitude: latitude, longitude: longitude);
  }
  
}
