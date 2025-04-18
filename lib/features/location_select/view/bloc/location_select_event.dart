part of 'location_select_bloc.dart';

@freezed
abstract class LocationSelectEvent with _$LocationSelectEvent {
  const factory LocationSelectEvent.fetchLocationsBasedOnUserInput(
      {required String input}) = FetchLocationsBasedOnUserInput;
  const factory LocationSelectEvent.updateSelectedLocation(Location location) =
      UpdateSelectedLocation;

  const factory LocationSelectEvent.deleteSelectedLocation() =
      DeleteSelectedLocation;
}
