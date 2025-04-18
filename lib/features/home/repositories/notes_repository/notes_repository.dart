import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_notes_app/data/models/note.dart';
import 'package:weather_notes_app/features/home/repositories/notes_repository/notes_repository_interface.dart';

class NotesRepository extends NotesRepositoryInterface {
  final _userId = FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference _notes =
      FirebaseFirestore.instance.collection("notes");

  @override
  Future<List<Note>> fetchNotes() async {
    try {
      final snapshot = await _notes
          .where("user_id", isEqualTo: _userId)
          .orderBy("lastInteracted", descending: true)
          .get();
      return snapshot.docs.map((doc) {
        return Note.fromFirestore(doc);
      }).toList();
    } catch (e) {
      throw Exception('Error fetching sticker sets: $e');
    }
  }

  @override
  Future<void> addNote(Note note) async {
    try {
      final noteToAdd = note.toJson(_userId);
      await _notes.add(noteToAdd);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> deleteNote(String docId) async {
    try {
      final doc = await _notes.doc(docId).get();
      if (!doc.exists) {
        throw Exception("Note not found. Unable to delete.");
      }
      await _notes.doc(docId).delete();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> updateNote(Note note) async {
    try {
      final doc = await _notes.doc(note.id).get();
      if (!doc.exists) {
        throw Exception("Note not found. Unable to update.");
      }
      await _notes.doc(note.id).update(note.toJson(_userId));
    } catch (e) {
      log(e.toString());
    }
  }
}
