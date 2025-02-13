import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_notes_app/domain/models/failure.dart';
import 'package:weather_notes_app/domain/models/note.dart';
import 'package:weather_notes_app/domain/models/success.dart';

class NotesService {
  final _userId = FirebaseAuth.instance.currentUser!.uid;

  final CollectionReference _notes =
      FirebaseFirestore.instance.collection("notes");

  Stream<QuerySnapshot> getNotes() {
    final notesStream = _notes
        .where("user_id", isEqualTo: _userId)
        .orderBy("lastInteracted", descending: true);
    return notesStream.snapshots();
  }

  Future<Either<Failure, Success>> addNote(Note note) async {
    try {
      final noteToAdd = note.toJson(_userId);

      await _notes.add(noteToAdd);
      return Right(Success(message: "Note added successfully."));
    } catch (e) {
      log(e.toString());
      return Left(
          Failure(errorMessage: "Some error occured,please,try again."));
    }
  }

  Future<Either<Failure, Success>> updateNote(String docId, Note note) async {
    try {
      final doc = await _notes.doc(docId).get();
      if (!doc.exists) {
        return Left(Failure(errorMessage: "Note not found. Unable to update."));
      }

      await _notes.doc(docId).update(note.toJson(_userId));
      return Right(Success(message: "Note updated successfully."));
    } catch (e) {
      log(e.toString());
      return Left(
          Failure(errorMessage: "Some error occured,please,try again."));
    }
  }

  Future<Either<Failure, Success>> deleteNote(String docId) async {
    try {
      final doc = await _notes.doc(docId).get();
      if (!doc.exists) {
        return Left(Failure(errorMessage: "Note not found. Unable to delete."));
      }
      
      await _notes.doc(docId).delete();
      return Right(Success(message: "Note deleted successfully."));
    } catch (e) {
      log(e.toString());
      return Left(
          Failure(errorMessage: "Some error occured,please,try again."));
    }
  }
}
