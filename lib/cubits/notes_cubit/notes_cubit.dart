import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_models.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes = [];
  fetchAllNotes() {
    var notesbox = Hive.box<NoteModel>(kNotesBox);

    notes = notesbox.values.toList();
    emit(NotesSuccess());
  }
}
