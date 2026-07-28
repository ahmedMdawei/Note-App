import 'package:flutter/material.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(

        ),
        SizedBox(height: 15,),
        TextField(
          maxLines: 5,
        ),
      ],
    );
  }
}
