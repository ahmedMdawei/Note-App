import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:note_app/screens/notes_screen.dart';
import 'package:note_app/widgets/floating_add_note_button.dart';
void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar', 'AE'),
        supportedLocales: const [
          Locale('ar', 'AE'), // دعم العربية
          Locale('en', 'US'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

      theme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: FloatingAddNoteButton(onPressed: () {

         },
         ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: const NotesScreen(),
      ),
    );
  }
}
