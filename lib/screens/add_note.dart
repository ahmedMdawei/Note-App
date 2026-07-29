import 'package:flutter/material.dart';
import 'package:note_app/widgets/addtional_widgets/tags.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: bottomInset > 0
              ? bottomInset + 16
              : 32, // دفع المحتوى فوق الكيبورد
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 1, 23, 45),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 32, 63),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),

            // عنوان الورقة
            const Text(
              'ملاحظة جديدة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),

            // البطاقة البيضاء الأساسية للكتابة
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 40, 78),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color.fromARGB(255, 55, 3, 175)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 47, 2, 151).withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // حقل العنوان
                    TextField(
                      controller: _titleController,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 247, 247, 249),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'العنوان',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // حقل المحتوى
                    Expanded(
                      child: TextField(
                        controller: _contentController,
                        maxLines: null, // يسمح بتمدد الأسطر
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 253, 253, 253),
                          height: 1.5,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'ابدأ الكتابة...',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 218, 217, 217),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // شريط الوسوم (Tags) السفلي
            Tags(),
          ],
        ),
      ),
    );
  }
}
