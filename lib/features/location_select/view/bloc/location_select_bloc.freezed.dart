// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_select_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationSelectEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationSelectEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationSelectEvent()';
  }
}

/// @nodoc
class $LocationSelectEventCopyWith<$Res> {
  $LocationSelectEventCopyWith(
      LocationSelectEvent _, $Res Function(LocationSelectEvent) __);
}

/// @nodoc

class FetchLocationsBasedOnUserInput implements LocationSelectEvent {
  const FetchLocationsBasedOnUserInput({required this.input});

  final String input;

  /// Create a copy of LocationSelectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FetchLocationsBasedOnUserInputCopyWith<FetchLocationsBasedOnUserInput>
      get copyWith => _$FetchLocationsBasedOnUserInputCopyWithImpl<
          FetchLocationsBasedOnUserInput>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchLocationsBasedOnUserInput &&
            (identical(other.input, input) || other.input == input));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input);

  @override
  String toString() {
    return 'LocationSelectEvent.fetchLocationsBasedOnUserInput(input: $input)';
  }
}

/// @nodoc
abstract mixin class $FetchLocationsBasedOnUserInputCopyWith<$Res>
    implements $LocationSelectEventCopyWith<$Res> {
  factory $FetchLocationsBasedOnUserInputCopyWith(
          FetchLocationsBasedOnUserInput value,
          $Res Function(FetchLocationsBasedOnUserInput) _then) =
      _$FetchLocationsBasedOnUserInputCopyWithImpl;
  @useResult
  $Res call({String input});
}

/// @nodoc
class _$FetchLocationsBasedOnUserInputCopyWithImpl<$Res>
    implements $FetchLocationsBasedOnUserInputCopyWith<$Res> {
  _$FetchLocationsBasedOnUserInputCopyWithImpl(this._self, this._then);

  final FetchLocationsBasedOnUserInput _self;
  final $Res Function(FetchLocationsBasedOnUserInput) _then;

  /// Create a copy of LocationSelectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? input = null,
  }) {
    return _then(FetchLocationsBasedOnUserInput(
      input: null == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdateSelectedLocation implements LocationSelectEvent {
  const UpdateSelectedLocation(this.location);

  final Location location;

  /// Create a copy of LocationSelectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateSelectedLocationCopyWith<UpdateSelectedLocation> get copyWith =>
      _$UpdateSelectedLocationCopyWithImpl<UpdateSelectedLocation>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateSelectedLocation &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location);

  @override
  String toString() {
    return 'LocationSelectEvent.updateSelectedLocation(location: $location)';
  }
}

/// @nodoc
abstract mixin class $UpdateSelectedLocationCopyWith<$Res>
    implements $LocationSelectEventCopyWith<$Res> {
  factory $UpdateSelectedLocationCopyWith(UpdateSelectedLocation value,
          $Res Function(UpdateSelectedLocation) _then) =
      _$UpdateSelectedLocationCopyWithImpl;
  @useResult
  $Res call({Location location});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$UpdateSelectedLocationCopyWithImpl<$Res>
    implements $UpdateSelectedLocationCopyWith<$Res> {
  _$UpdateSelectedLocationCopyWithImpl(this._self, this._then);

  final UpdateSelectedLocation _self;
  final $Res Function(UpdateSelectedLocation) _then;

  /// Create a copy of LocationSelectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? location = null,
  }) {
    return _then(UpdateSelectedLocation(
      null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }

  /// Create a copy of LocationSelectEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc

class DeleteSelectedLocation implements LocationSelectEvent {
  const DeleteSelectedLocation();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteSelectedLocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationSelectEvent.deleteSelectedLocation()';
  }
}

/// @nodoc
mixin _$LocationSelectState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationSelectState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationSelectState()';
  }
}

/// @nodoc
class $LocationSelectStateCopyWith<$Res> {
  $LocationSelectStateCopyWith(
      LocationSelectState _, $Res Function(LocationSelectState) __);
}

/// @nodoc

class LocationSelectInitial implements LocationSelectState {
  const LocationSelectInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationSelectInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationSelectState.initial()';
  }
}

/// @nodoc

class LocationSelectLoading implements LocationSelectState {
  const LocationSelectLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationSelectLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationSelectState.loading()';
  }
}

/// @nodoc

class LocationSelectSuccess implements LocationSelectState {
  const LocationSelectSuccess(final List<Location> predictions)
      : _predictions = predictions;

  final List<Location> _predictions;
  List<Location> get predictions {
    if (_predictions is EqualUnmodifiableListView) return _predictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_predictions);
  }

  /// Create a copy of LocationSelectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationSelectSuccessCopyWith<LocationSelectSuccess> get copyWith =>
      _$LocationSelectSuccessCopyWithImpl<LocationSelectSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationSelectSuccess &&
            const DeepCollectionEquality()
                .equals(other._predictions, _predictions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_predictions));

  @override
  String toString() {
    return 'LocationSelectState.success(predictions: $predictions)';
  }
}

/// @nodoc
abstract mixin class $LocationSelectSuccessCopyWith<$Res>
    implements $LocationSelectStateCopyWith<$Res> {
  factory $LocationSelectSuccessCopyWith(LocationSelectSuccess value,
          $Res Function(LocationSelectSuccess) _then) =
      _$LocationSelectSuccessCopyWithImpl;
  @useResult
  $Res call({List<Location> predictions});
}

/// @nodoc
class _$LocationSelectSuccessCopyWithImpl<$Res>
    implements $LocationSelectSuccessCopyWith<$Res> {
  _$LocationSelectSuccessCopyWithImpl(this._self, this._then);

  final LocationSelectSuccess _self;
  final $Res Function(LocationSelectSuccess) _then;

  /// Create a copy of LocationSelectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? predictions = null,
  }) {
    return _then(LocationSelectSuccess(
      null == predictions
          ? _self._predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<Location>,
    ));
  }
}

/// @nodoc

class LocationSelectFailure implements LocationSelectState {
  const LocationSelectFailure();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationSelectFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationSelectState.failure()';
  }
}

/// @nodoc

class LocationSelectUpdateSuccess implements LocationSelectState {
  const LocationSelectUpdateSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationSelectUpdateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationSelectState.successLocationUpdate()';
  }
}

/// @nodoc

class LocationSelectDeleteSuccess implements LocationSelectState {
  const LocationSelectDeleteSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationSelectDeleteSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationSelectState.successLocationDelete()';
  }
}

// dart format on
