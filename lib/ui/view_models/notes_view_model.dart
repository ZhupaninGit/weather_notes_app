import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weather_notes_app/domain/models/note.dart';
import 'package:weather_notes_app/domain/services/notes_service.dart';
import 'package:weather_notes_app/ui/components/custom_snackbar.dart';

class NotesViewModel extends ChangeNotifier {
  final NotesService _notesService = NotesService();
  StreamSubscription? _notesSubscription;

  final CustomSnackBar _snackBar = CustomSnackBar();

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  NotesViewModel() {
    _listenToNotes();
  }

  @override
  void dispose() {
    _notesSubscription?.cancel();
    super.dispose();
  }

  void _listenToNotes() {
    _notesSubscription = _notesService.getNotes().listen((snapshot) {
      _notes = snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList();
      notifyListeners();
    }, onError: (error) {
      log("Error fetching notes: $error");
    });
  }

  Future<void> addNote(BuildContext context, Note note) async {
    final result = await _notesService.addNote(note);
    result.fold(
      (error) => _snackBar.showCustomSnackBar(context, error.errorMessage, true),
      (success) {
        _snackBar.showCustomSnackBar(context, success.message!, false);
        Navigator.of(context).pop();
      },
    );
  }

  Future<void> updateNote(BuildContext context, Note note) async {
    final result = await _notesService.updateNote(note.id!, note);
    result.fold(
      (error) => _snackBar.showCustomSnackBar(context, error.errorMessage, true),
      (success) {
        _snackBar.showCustomSnackBar(context, success.message!, false);
        Navigator.of(context).pop();
      },
    );
  }

  Future<void> deleteNote(BuildContext context, String docId) async {
    final result = await _notesService.deleteNote(docId);
    result.fold(
      (error) => _snackBar.showCustomSnackBar(context, error.errorMessage, true),
      (success) {
        _snackBar.showCustomSnackBar(context, success.message!, false);
        Navigator.of(context).pop();
      },
    );
  }
}
