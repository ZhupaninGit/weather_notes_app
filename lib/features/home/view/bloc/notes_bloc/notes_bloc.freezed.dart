// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotesEvent()';
  }
}

/// @nodoc
class $NotesEventCopyWith<$Res> {
  $NotesEventCopyWith(NotesEvent _, $Res Function(NotesEvent) __);
}

/// @nodoc

class FetchNotesEvent implements NotesEvent {
  const FetchNotesEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchNotesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotesEvent.fetchNotes()';
  }
}

/// @nodoc

class AddNoteEvent implements NotesEvent {
  const AddNoteEvent(this.note);

  final Note note;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddNoteEventCopyWith<AddNoteEvent> get copyWith =>
      _$AddNoteEventCopyWithImpl<AddNoteEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddNoteEvent &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note);

  @override
  String toString() {
    return 'NotesEvent.addNote(note: $note)';
  }
}

/// @nodoc
abstract mixin class $AddNoteEventCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory $AddNoteEventCopyWith(
          AddNoteEvent value, $Res Function(AddNoteEvent) _then) =
      _$AddNoteEventCopyWithImpl;
  @useResult
  $Res call({Note note});

  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class _$AddNoteEventCopyWithImpl<$Res> implements $AddNoteEventCopyWith<$Res> {
  _$AddNoteEventCopyWithImpl(this._self, this._then);

  final AddNoteEvent _self;
  final $Res Function(AddNoteEvent) _then;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? note = null,
  }) {
    return _then(AddNoteEvent(
      null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
    ));
  }

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NoteCopyWith<$Res> get note {
    return $NoteCopyWith<$Res>(_self.note, (value) {
      return _then(_self.copyWith(note: value));
    });
  }
}

/// @nodoc

class UpdateNoteEvent implements NotesEvent {
  const UpdateNoteEvent(this.note);

  final Note note;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateNoteEventCopyWith<UpdateNoteEvent> get copyWith =>
      _$UpdateNoteEventCopyWithImpl<UpdateNoteEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateNoteEvent &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note);

  @override
  String toString() {
    return 'NotesEvent.updateNote(note: $note)';
  }
}

/// @nodoc
abstract mixin class $UpdateNoteEventCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory $UpdateNoteEventCopyWith(
          UpdateNoteEvent value, $Res Function(UpdateNoteEvent) _then) =
      _$UpdateNoteEventCopyWithImpl;
  @useResult
  $Res call({Note note});

  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class _$UpdateNoteEventCopyWithImpl<$Res>
    implements $UpdateNoteEventCopyWith<$Res> {
  _$UpdateNoteEventCopyWithImpl(this._self, this._then);

  final UpdateNoteEvent _self;
  final $Res Function(UpdateNoteEvent) _then;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? note = null,
  }) {
    return _then(UpdateNoteEvent(
      null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
    ));
  }

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NoteCopyWith<$Res> get note {
    return $NoteCopyWith<$Res>(_self.note, (value) {
      return _then(_self.copyWith(note: value));
    });
  }
}

/// @nodoc

class DeleteNoteEvent implements NotesEvent {
  const DeleteNoteEvent(this.docId);

  final String docId;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteNoteEventCopyWith<DeleteNoteEvent> get copyWith =>
      _$DeleteNoteEventCopyWithImpl<DeleteNoteEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteNoteEvent &&
            (identical(other.docId, docId) || other.docId == docId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, docId);

  @override
  String toString() {
    return 'NotesEvent.deleteNote(docId: $docId)';
  }
}

/// @nodoc
abstract mixin class $DeleteNoteEventCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory $DeleteNoteEventCopyWith(
          DeleteNoteEvent value, $Res Function(DeleteNoteEvent) _then) =
      _$DeleteNoteEventCopyWithImpl;
  @useResult
  $Res call({String docId});
}

/// @nodoc
class _$DeleteNoteEventCopyWithImpl<$Res>
    implements $DeleteNoteEventCopyWith<$Res> {
  _$DeleteNoteEventCopyWithImpl(this._self, this._then);

  final DeleteNoteEvent _self;
  final $Res Function(DeleteNoteEvent) _then;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? docId = null,
  }) {
    return _then(DeleteNoteEvent(
      null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$NotesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotesState()';
  }
}

/// @nodoc
class $NotesStateCopyWith<$Res> {
  $NotesStateCopyWith(NotesState _, $Res Function(NotesState) __);
}

/// @nodoc

class NotesLoadingState implements NotesState {
  const NotesLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotesLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotesState.loading()';
  }
}

/// @nodoc

class NotesLoadedState implements NotesState {
  const NotesLoadedState(final List<Note> notes) : _notes = notes;

  final List<Note> _notes;
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotesLoadedStateCopyWith<NotesLoadedState> get copyWith =>
      _$NotesLoadedStateCopyWithImpl<NotesLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotesLoadedState &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  @override
  String toString() {
    return 'NotesState.loaded(notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $NotesLoadedStateCopyWith<$Res>
    implements $NotesStateCopyWith<$Res> {
  factory $NotesLoadedStateCopyWith(
          NotesLoadedState value, $Res Function(NotesLoadedState) _then) =
      _$NotesLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<Note> notes});
}

/// @nodoc
class _$NotesLoadedStateCopyWithImpl<$Res>
    implements $NotesLoadedStateCopyWith<$Res> {
  _$NotesLoadedStateCopyWithImpl(this._self, this._then);

  final NotesLoadedState _self;
  final $Res Function(NotesLoadedState) _then;

  /// Create a copy of NotesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notes = null,
  }) {
    return _then(NotesLoadedState(
      null == notes
          ? _self._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc

class NotesActionSuccessState implements NotesState {
  const NotesActionSuccessState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotesActionSuccessState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotesState.notesActionSuccess()';
  }
}

/// @nodoc

class NotesLoadFailureState implements NotesState {
  const NotesLoadFailureState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotesLoadFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotesState.failure()';
  }
}

// dart format on
