import 'package:weather_notes_app/data/models/location.dart';

abstract class LocationSelectRepositoryInterface {
  Future<List<Location>> getLocationsPrediction(String input);
  Future<void> setSelectedLocation(Location location);
  Future<void> deleteSelectedLocation();
}
