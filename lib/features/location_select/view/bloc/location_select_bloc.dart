
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_notes_app/data/models/location.dart';
import 'package:weather_notes_app/features/location_select/repositories/location_select_repository_interface.dart';

part 'location_select_event.dart';
part 'location_select_state.dart';
part 'location_select_bloc.freezed.dart';

class LocationSelectBloc
    extends Bloc<LocationSelectEvent, LocationSelectState> {
  final LocationSelectRepositoryInterface _locationSelectRepository;
  LocationSelectBloc({required LocationSelectRepositoryInterface repository})
      : _locationSelectRepository = repository,
        super(LocationSelectInitial()) {
    on<FetchLocationsBasedOnUserInput>(_getPredictions);
    on<UpdateSelectedLocation>(_updateSelectedLocation);
    on<DeleteSelectedLocation>(_deleteSelectedLocation);
  }

  Future<void> _getPredictions(
    FetchLocationsBasedOnUserInput event,
    Emitter<LocationSelectState> emit,
  ) async {
    try {
      emit(const LocationSelectLoading());
      final predictions =
          await _locationSelectRepository.getLocationsPrediction(event.input);
      emit(LocationSelectSuccess(predictions));
    } catch (e) {
      emit(LocationSelectFailure());
    }
  }

  Future<void> _updateSelectedLocation(
    UpdateSelectedLocation event,
    Emitter<LocationSelectState> emit,
  ) async {
    try {
      emit(const LocationSelectLoading());
      await _locationSelectRepository.setSelectedLocation(event.location);
      emit(const LocationSelectUpdateSuccess());
    } catch (e) {
      emit(LocationSelectFailure());
    }
  }

  Future<void> _deleteSelectedLocation(
    DeleteSelectedLocation event,
    Emitter<LocationSelectState> emit,
  ) async {
    try {
      emit(const LocationSelectLoading());
      await _locationSelectRepository.deleteSelectedLocation();
      emit(const LocationSelectDeleteSuccess());
    } catch (e) {
      emit(LocationSelectFailure());
    }
  }
}
