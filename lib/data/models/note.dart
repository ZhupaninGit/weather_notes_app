import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
abstract class Note with _$Note {
  const Note._();
  
  const factory Note({
    String? id,
    required String title,
    required String body,
    required DateTime lastInteracted,
  }) = _Note;


  factory Note.fromJson(Map<String, dynamic> data, {String? id}) {
    return Note(
      id: id,
      title: data['title'] as String,
      body: data['body'] as String,
      lastInteracted: (data['lastInteracted'] as Timestamp).toDate(),
    );
  }

  factory Note.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?; 
    if (data == null) throw Exception("Document data is null");
    return Note.fromJson(data, id: doc.id);
  }

  Map<String, dynamic> toJson(String userId) {
    return {
      'user_id': userId,
      'title': title,
      'body': body,
      'lastInteracted': Timestamp.fromDate(lastInteracted),
    };
  }  
}



