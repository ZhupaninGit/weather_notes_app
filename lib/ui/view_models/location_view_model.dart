import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_notes_app/domain/models/location.dart';
import 'package:weather_notes_app/domain/services/location_service.dart';
import 'package:weather_notes_app/domain/services/shared_preferences_service.dart';
import 'package:weather_notes_app/ui/components/custom_snackbar.dart';
import 'package:weather_notes_app/ui/view_models/weather_view_model.dart';

class PlaceViewModel extends ChangeNotifier {
  final LocationService _placesService = LocationService();
  final SharedPreferencesService _preferencesService =
      SharedPreferencesService();
  final CustomSnackBar _snackBar = CustomSnackBar();

  String? _errorMessage;
  List<Location>? _predictedLocation;

  String? get errorMessage => _errorMessage;
  List<Location>? get predictedLocations => _predictedLocation;

  Future<void> updateLocationPredictions(String input) async {
    if (input.isEmpty) {
      _predictedLocation = null;
      _errorMessage = null;
      notifyListeners();
      return;
    }

    final result = await _placesService.getLocationPrediction(input);
    result.fold(
      (error) {
        _errorMessage = error.errorMessage;
      },
      (success) {
        _errorMessage = null;
        _predictedLocation = success.result as List<Location>;
      },
    );
    notifyListeners();
  }

  Future<void> getCoordinatesAndSetSelectedLocation(
      Location choosedPlace, BuildContext context) async {
    final result = await _placesService.getLocationCoordinates(choosedPlace);
    result.fold(
      (error) =>
          _snackBar.showCustomSnackBar(context, error.errorMessage, true),
      (success) async {
        final location = success.result as Location;
        context.read<WeatherViewModel>().setSelectedLocation(location);
        _preferencesService.saveSelectedLocation(location);
        Navigator.of(context).pop();
      },
    );
  }

  void deleteSelectedLocation(BuildContext context) {
    _preferencesService.deleteDefaultLocation();
    context.read<WeatherViewModel>().deleteSelectedLocation();
    Navigator.of(context).pop();
  }
}
