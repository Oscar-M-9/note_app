import 'package:notes_app_flutter/services/db_note.dart';

class Note {
  int? key;
  String? title;
  String? body;

  Note({
    this.key,
    this.title,
    this.body,
  });

  Note.fromMap(Map<String, dynamic> map) {
    key = map['key'];
    title = map['title'];
    body = map['body'];
  }
  Map<String, dynamic> toMap() {
    return {
      DBNote.columnKey: key,
      DBNote.columnTitle: title,
      DBNote.columnBody: body,
    };
  }
}
