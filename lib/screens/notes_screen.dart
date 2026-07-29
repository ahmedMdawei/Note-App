import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_note_bottom_sheet.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/floating_add_note_button.dart';
import 'package:note_app/widgets/notes_listview_builder.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20),
            CustomAppbar(),
            SizedBox(height: 5),
            Expanded(child: NotesListviewBuilder()),
          ],
        ),
        floatingActionButton: FloatingAddNoteButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled:
                  true, // ضروري جداً لتغطية مساحة أكبر وللتعامل مع الكيبورد
              backgroundColor: Colors
                  .transparent, // لجعل الحواف العلوية الدائرية تظهر بشكل صحيح
              builder: (BuildContext context) {
                return const AddNoteBottomSheet();
              },
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
