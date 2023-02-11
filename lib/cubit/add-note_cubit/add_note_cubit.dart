// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';

import '../../models/note_model.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addnote(NoteModel note) async {
    emit(AddNoteLoading());

    try {
      var notesbox = Hive.box<NoteModel>(knotes);
      emit(AddNoteSuccess());
      await notesbox.add(note);
    } on Exception catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
