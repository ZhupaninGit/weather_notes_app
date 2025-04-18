part of 'location_select_bloc.dart';

@freezed
class LocationSelectState with _$LocationSelectState {
  const factory LocationSelectState.initial() = LocationSelectInitial;
  const factory LocationSelectState.loading() = LocationSelectLoading;
  const factory LocationSelectState.success(List<Location> predictions) = LocationSelectSuccess;
  const factory LocationSelectState.failure() = LocationSelectFailure;

  const factory LocationSelectState.successLocationUpdate() = LocationSelectUpdateSuccess;
  const factory LocationSelectState.successLocationDelete() = LocationSelectDeleteSuccess;


}
