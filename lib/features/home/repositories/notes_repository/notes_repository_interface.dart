import 'package:weather_notes_app/data/models/note.dart';

abstract class NotesRepositoryInterface {
  Future<List<Note>> fetchNotes();
  Future addNote(Note note);
  Future updateNote(Note note);
  Future deleteNote(String docId);
}
