import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/note_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
   Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox(knotes);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}
