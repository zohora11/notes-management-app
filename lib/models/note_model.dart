import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents a single Note stored in Cloud Firestore.
class Note {
  final String id;
  final String title;
  final String description;
  final Timestamp? createdAt;

  Note({
    required this.id,
    required this.title,
    required this.description,
    this.createdAt,
  });

  /// Converts a Firestore document into a [Note] object.
  factory Note.fromMap(String id, Map<String, dynamic> data) {
    return Note(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      createdAt: data['createdAt'] as Timestamp?,
    );
  }

  /// Converts this [Note] into a map for writing to Firestore.
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}