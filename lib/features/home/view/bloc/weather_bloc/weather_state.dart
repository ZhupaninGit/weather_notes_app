part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.success(Weather weather) = WeatherSuccess;
  const factory WeatherState.loading() = WeatherLoading;
  const factory WeatherState.failure(String message) = WeatherFailure;
}
