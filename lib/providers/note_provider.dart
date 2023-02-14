import 'package:flutter/material.dart';
import 'package:notes_app_flutter/services/db_note.dart';

import '../models/notes_model.dart';

class NoteProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final dbNote = DBNote.instance;
  List<Note> note = [];
  List<Note> listSearchNote = [];
  String _searchNote = '';
  String get searchNote => _searchNote;
  set searchNote(String val) {
    _searchNote = val;
    notifyListeners();
  }

  /* Search Note */
  void search(String val) {
    listSearchNote.clear();
    if (val.isNotEmpty) {
      listSearchNote.addAll(note.where((element) {
        return element.body!.toLowerCase().contains(val) || element.title!.toLowerCase().contains(val);
      }));
    }
  }

  /* List Note */
  Future<List<Note>> allNote() async {
    final allrows = await dbNote.listNotes();
    note.clear();
    for (var element in allrows) {
      note.add(Note.fromMap(element));
    }
    notifyListeners();
    return note;
  }

  /* Create Note */
  void insertNote(title, body) async {
    Map<String, dynamic> row = {
      DBNote.columnTitle: title,
      DBNote.columnBody: body,
    };
    Note note = Note.fromMap(row);
    await dbNote.createNote(note);
    allNote();
    notifyListeners();
  }

  /* Update Note */
  void updateNote(key, title, body) async {
    Note note = Note(key: key, title: title, body: body);
    await dbNote.updateNote(note);
    notifyListeners();
  }

  /* Delete Note */
  void deleteNote(key) async {
    await dbNote.deleteNote(key);
    notifyListeners();
  }

  /* Delete all Notes */
  void deleteNotes() async {
    await dbNote.deleteAllNotes();
    notifyListeners();
  }
}
