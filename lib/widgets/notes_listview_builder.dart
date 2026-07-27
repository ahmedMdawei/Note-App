import 'package:flutter/material.dart';
import 'package:note_app/widgets/note_card.dart';

class NotesListviewBuilder extends StatelessWidget {
  const NotesListviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: const NoteCard(
                backgroundColor: Color(0xFFFFDAB9), // لون برتقالي فاتح (Peach)
                title: 'اجتماع مع فريق التصميم',
                contentLines: [
                  'تمت مناقشة بنية المكونات الجديدة. يجب الانتهاء من ألوان التصميم بحلول يوم الجمعة. تأكد من توثيق جميع الحالات (التحويم، النشط، التركيز) في...',
                ],
                dateText: 'منذ ساعتين', tags: ['شعر'], ),
      );
    });
  }
}
