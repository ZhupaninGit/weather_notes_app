part of 'notes_bloc.dart';

@freezed
class NotesEvent with _$NotesEvent {
  const factory NotesEvent.fetchNotes() = FetchNotesEvent;
  const factory NotesEvent.addNote(Note note) = AddNoteEvent;
  const factory NotesEvent.updateNote(Note note) = UpdateNoteEvent;
  const factory NotesEvent.deleteNote(String docId) = DeleteNoteEvent;

}
