import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_notes_app/data/models/weather.dart';
import 'package:weather_notes_app/features/home/repositories/weather_repository/repositories.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositoryInterface _weatherRepository;

  WeatherBloc({required WeatherRepositoryInterface repository})
      : _weatherRepository = repository,
        super(const WeatherLoading()) {
    on<FetchWeatherEvent>(_getWeather);
  }

  Future<void> _getWeather(
    FetchWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(const WeatherLoading());
      final weather = await _weatherRepository.getWeather();
      emit(WeatherSuccess(weather!));
    } on WeatherException catch (e) {
      emit(WeatherFailure(e.errorMessage));
    }
  }


}
