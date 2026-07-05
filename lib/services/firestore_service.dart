import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';

/// Handles all Create, Read, Update, and Delete (CRUD) operations
/// for Notes stored in the "notes" collection in Cloud Firestore.
class FirestoreService {
  final CollectionReference _notesCollection =
  FirebaseFirestore.instance.collection('notes');

  /// CREATE: Adds a new note to Firestore.
  Future<void> addNote(String title, String description) async {
    await _notesCollection.add({
      'title': title,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// READ: Returns a real-time stream of all notes, newest first.
  Stream<List<Note>> getNotesStream() {
    return _notesCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) =>
        Note.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList());
  }

  /// UPDATE: Updates an existing note by its document id.
  Future<void> updateNote(
      String id, String title, String description) async {
    await _notesCollection.doc(id).update({
      'title': title,
      'description': description,
    });
  }

  /// DELETE: Removes a note by its document id.
  Future<void> deleteNote(String id) async {
    await _notesCollection.doc(id).delete();
  }
}