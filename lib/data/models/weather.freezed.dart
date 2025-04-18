// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Weather {
  String get city;
  String get weatherConditions;
  double get temperature;
  num get humidity;
  double get windSpeed;
  Icon get icon;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<Weather> get copyWith =>
      _$WeatherCopyWithImpl<Weather>(this as Weather, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Weather &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.weatherConditions, weatherConditions) ||
                other.weatherConditions == weatherConditions) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city, weatherConditions,
      temperature, humidity, windSpeed, icon);

  @override
  String toString() {
    return 'Weather(city: $city, weatherConditions: $weatherConditions, temperature: $temperature, humidity: $humidity, windSpeed: $windSpeed, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) _then) =
      _$WeatherCopyWithImpl;
  @useResult
  $Res call(
      {String city,
      String weatherConditions,
      double temperature,
      num humidity,
      double windSpeed,
      Icon icon});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._self, this._then);

  final Weather _self;
  final $Res Function(Weather) _then;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? weatherConditions = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? icon = null,
  }) {
    return _then(_self.copyWith(
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      weatherConditions: null == weatherConditions
          ? _self.weatherConditions
          : weatherConditions // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as num,
      windSpeed: null == windSpeed
          ? _self.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
    ));
  }
}

/// @nodoc

class _Weather implements Weather {
  const _Weather(
      {required this.city,
      required this.weatherConditions,
      required this.temperature,
      required this.humidity,
      required this.windSpeed,
      required this.icon});

  @override
  final String city;
  @override
  final String weatherConditions;
  @override
  final double temperature;
  @override
  final num humidity;
  @override
  final double windSpeed;
  @override
  final Icon icon;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherCopyWith<_Weather> get copyWith =>
      __$WeatherCopyWithImpl<_Weather>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Weather &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.weatherConditions, weatherConditions) ||
                other.weatherConditions == weatherConditions) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city, weatherConditions,
      temperature, humidity, windSpeed, icon);

  @override
  String toString() {
    return 'Weather(city: $city, weatherConditions: $weatherConditions, temperature: $temperature, humidity: $humidity, windSpeed: $windSpeed, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) _then) =
      __$WeatherCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String city,
      String weatherConditions,
      double temperature,
      num humidity,
      double windSpeed,
      Icon icon});
}

/// @nodoc
class __$WeatherCopyWithImpl<$Res> implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(this._self, this._then);

  final _Weather _self;
  final $Res Function(_Weather) _then;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? city = null,
    Object? weatherConditions = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? icon = null,
  }) {
    return _then(_Weather(
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      weatherConditions: null == weatherConditions
          ? _self.weatherConditions
          : weatherConditions // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as num,
      windSpeed: null == windSpeed
          ? _self.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
    ));
  }
}

// dart format on
