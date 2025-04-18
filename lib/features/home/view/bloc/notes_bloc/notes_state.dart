part of 'notes_bloc.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.loading() = NotesLoadingState;
  const factory NotesState.loaded( List<Note> notes) = NotesLoadedState;
  const factory NotesState.notesActionSuccess() = NotesActionSuccessState;
  const factory NotesState.failure() = NotesLoadFailureState;


}
