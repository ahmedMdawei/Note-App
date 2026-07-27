import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:note_app/screens/notes_screen.dart';
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
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 45, 53, 56),
          titleSpacing: 20,
          actionsPadding: EdgeInsets.only(left: 20),
          title: Text("ملاحظاتي"),
          actions: [
            Icon(Icons.search,
            size: 30,
            ),
          ],

        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.plus_one),),
        body: const NotesScreen(),
      ),
    );
  }
}
