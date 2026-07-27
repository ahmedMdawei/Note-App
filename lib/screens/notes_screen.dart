import 'package:flutter/material.dart';
import 'package:note_app/widgets/note_card.dart';

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
          NoteCard(
              backgroundColor: const Color(0xFFFFDAB9), // لون برتقالي فاتح (Peach)
              title: 'اجتماع مع فريق التصميم',
              contentLines: const [
                'تمت مناقشة بنية المكونات الجديدة. يجب الانتهاء من ألوان التصميم بحلول يوم الجمعة. تأكد من توثيق جميع الحالات (التحويم، النشط، التركيز) في...',
              ],
              dateText: 'منذ ساعتين', tags: ['شعر'],)
        ],
      ),
    );
  }
}
