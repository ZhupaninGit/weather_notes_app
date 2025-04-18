// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeatherEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeatherEvent()';
  }
}

/// @nodoc
class $WeatherEventCopyWith<$Res> {
  $WeatherEventCopyWith(WeatherEvent _, $Res Function(WeatherEvent) __);
}

/// @nodoc

class FetchWeatherEvent implements WeatherEvent {
  const FetchWeatherEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchWeatherEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeatherEvent.fetchWeather()';
  }
}

/// @nodoc
mixin _$WeatherState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeatherState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeatherState()';
  }
}

/// @nodoc
class $WeatherStateCopyWith<$Res> {
  $WeatherStateCopyWith(WeatherState _, $Res Function(WeatherState) __);
}

/// @nodoc

class WeatherSuccess implements WeatherState {
  const WeatherSuccess(this.weather);

  final Weather weather;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherSuccessCopyWith<WeatherSuccess> get copyWith =>
      _$WeatherSuccessCopyWithImpl<WeatherSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherSuccess &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weather);

  @override
  String toString() {
    return 'WeatherState.success(weather: $weather)';
  }
}

/// @nodoc
abstract mixin class $WeatherSuccessCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory $WeatherSuccessCopyWith(
          WeatherSuccess value, $Res Function(WeatherSuccess) _then) =
      _$WeatherSuccessCopyWithImpl;
  @useResult
  $Res call({Weather weather});

  $WeatherCopyWith<$Res> get weather;
}

/// @nodoc
class _$WeatherSuccessCopyWithImpl<$Res>
    implements $WeatherSuccessCopyWith<$Res> {
  _$WeatherSuccessCopyWithImpl(this._self, this._then);

  final WeatherSuccess _self;
  final $Res Function(WeatherSuccess) _then;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? weather = null,
  }) {
    return _then(WeatherSuccess(
      null == weather
          ? _self.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather,
    ));
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res> get weather {
    return $WeatherCopyWith<$Res>(_self.weather, (value) {
      return _then(_self.copyWith(weather: value));
    });
  }
}

/// @nodoc

class WeatherLoading implements WeatherState {
  const WeatherLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeatherLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeatherState.loading()';
  }
}

/// @nodoc

class WeatherFailure implements WeatherState {
  const WeatherFailure(this.message);

  final String message;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherFailureCopyWith<WeatherFailure> get copyWith =>
      _$WeatherFailureCopyWithImpl<WeatherFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'WeatherState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $WeatherFailureCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory $WeatherFailureCopyWith(
          WeatherFailure value, $Res Function(WeatherFailure) _then) =
      _$WeatherFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$WeatherFailureCopyWithImpl<$Res>
    implements $WeatherFailureCopyWith<$Res> {
  _$WeatherFailureCopyWithImpl(this._self, this._then);

  final WeatherFailure _self;
  final $Res Function(WeatherFailure) _then;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(WeatherFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
