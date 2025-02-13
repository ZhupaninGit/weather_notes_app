import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_notes_app/domain/models/location.dart';

abstract class SharedPreferencesConstants {
  static const defaultLocation = "default_location";
}

class SharedPreferencesService {
  Future<void> saveSelectedLocation(Location place) async {
    final prefs = await SharedPreferences.getInstance();
    final serialazibleLocation = jsonEncode(place.toJson());
    await prefs.setString(
        SharedPreferencesConstants.defaultLocation, serialazibleLocation);
  }

  Future<Location?> getSelectedLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final location = prefs.getString(SharedPreferencesConstants.defaultLocation);
    if (location == null) return null;
    return Location.fromJson(jsonDecode(location));
  }

  Future<void> deleteDefaultLocation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(SharedPreferencesConstants.defaultLocation);
  }
}
