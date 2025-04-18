import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_notes_app/features/home/repositories/notes_repository/notes_repository_interface.dart';

import '../../../../../data/models/note.dart';

part 'notes_event.dart';
part 'notes_state.dart';
part 'notes_bloc.freezed.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepositoryInterface _notesRepository;

  NotesBloc({required NotesRepositoryInterface repository})
      : _notesRepository = repository,
        super(const NotesLoadingState()) {
    on<FetchNotesEvent>(_fetchNotes);
    on<AddNoteEvent>(_addNote);
    on<DeleteNoteEvent>(_deleteNote);
    on<UpdateNoteEvent>(_updateNote);
  }

  void _fetchNotes(FetchNotesEvent event, Emitter<NotesState> emit) async {
    try {
      emit(const NotesLoadingState());
      final notes = await _notesRepository.fetchNotes();
      emit(NotesLoadedState(notes));
    } catch (e) {
      emit(const NotesLoadFailureState());
    }
  }

  void _addNote(AddNoteEvent event, Emitter<NotesState> emit) async {
    try {
      emit(const NotesLoadingState());
      await _notesRepository.addNote(event.note);
      final notes = await _notesRepository.fetchNotes();
      emit(NotesLoadedState(notes));
    } catch (e) {
      emit(const NotesLoadFailureState());
    }
  }

  void _updateNote(UpdateNoteEvent event, Emitter<NotesState> emit) async {
    try {
      emit(const NotesLoadingState());
      await _notesRepository.updateNote(event.note);
      final notes = await _notesRepository.fetchNotes();
      emit(NotesLoadedState(notes));
    } catch (e) {
      emit(const NotesLoadFailureState());
    }
  }

  void _deleteNote(DeleteNoteEvent event, Emitter<NotesState> emit) async {
    try {
      emit(const NotesLoadingState());
      await _notesRepository.deleteNote(event.docId);
      final notes = await _notesRepository.fetchNotes();
      emit(NotesLoadedState(notes));
    } catch (e) {
      emit(const NotesLoadFailureState());
    }
  }
}
