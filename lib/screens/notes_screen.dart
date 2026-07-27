import 'package:flutter/material.dart';
import 'package:note_app/widgets/notes_listview_builder.dart';
class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(child: NotesListviewBuilder()),
        ],
      ),
    );
  }
}
