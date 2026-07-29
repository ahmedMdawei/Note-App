import 'package:flutter/material.dart';

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
    //  مساحة الكيبورد السفلية لرفع المحتوى عند الكتابة
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
                  color: Color.fromARGB(255, 1, 23, 45),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
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
                          hintStyle: TextStyle(color: Color.fromARGB(255, 218, 217, 217)),
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
            _buildTagsRow(),
          ],
        ),
      ),
    );
  }


  Widget _buildTagsRow() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(left: 8),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 197, 226, 247),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Color.fromARGB(255, 213, 233, 249), size: 20),
              onPressed: () {
                // منطق إضافة وسم جديد
              },
            ),
          ),
          _buildTagChip(
            'العمل',
            const Color(0xFFFFF9C4),
            const Color(0xFFFBC02D),
            Icons.work_outline,
          ),
          _buildTagChip(
            'واجبات',
            const Color(0xFFE8F5E9),
            const Color(0xFF4CAF50),
            Icons.description_outlined,
          ),
          _buildTagChip(
            'فكر',
            const Color(0xFFF3E5F5),
            const Color(0xFF9C27B0),
            Icons.lightbulb_outline,
          ),
        ],
      ),
    );
  }

  Widget _buildTagChip(
    String label,
    Color bgColor,
    Color textColor,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
