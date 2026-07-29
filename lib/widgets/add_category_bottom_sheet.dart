import 'package:flutter/material.dart';

class AddCategoryBottomSheet extends StatefulWidget {
  const AddCategoryBottomSheet({super.key});

  @override
  State<AddCategoryBottomSheet> createState() => _AddCategoryBottomSheetState();
}

class _AddCategoryBottomSheetState extends State<AddCategoryBottomSheet> {
  final TextEditingController _categoryNameController = TextEditingController();

  // قائمة الألوان
  final List<Color> _availableColors = const [
    Color(0xFFFFD8D8), // وردي فاتح
    Color(0xFFB87333), // بني/نحاسي
    Color(0xFFD0D9F5), // أزرق فاتح جداً
    Color(0xFF5C6BC0), // أزرق (الافتراضي)
    Color(0xFFE0E0E0), // رمادي
    Color(0xFFB3B3FF), // بنفسجي فاتح
  ];

  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    // تعيين اللون الافتراضي عند فتح الواجهة
    _selectedColor = _availableColors[3];
  }

  @override
  void dispose() {
    _categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: bottomInset, // لرفع الواجهة عند ظهور لوحة المفاتيح
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 1, 23, 45),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // لتأخذ مساحة المحتوى فقط
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // مؤشر السحب العلوي (Drag Handle)
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 1, 23, 45),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // عنوان الواجهة
              const Text(
                'إضافة تصنيف جديد',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 247, 247),
                ),
              ),
              const SizedBox(height: 24),

              // حاوية النموذج (البطاقة البيضاء)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 40, 78),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // حقل اسم التصنيف
                    const Text(
                      'اسم التصنيف',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 252, 252, 252),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _categoryNameController,
                      decoration: InputDecoration(
                        hintText: 'ادخل اسم التصنيف...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Color.fromARGB(255, 2, 40, 78),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // منتقي الألوان (Color Picker)
                    const Text(
                      'اختر لوناً',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 252, 250, 250),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: _availableColors.map((color) => _buildColorCircle(color)).toList(),
                    ),

                    const SizedBox(height: 24),
                    const Divider(color: Color(0xFFEEEEEE), thickness: 1),
                    const SizedBox(height: 24),

                    // زر الإضافة
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // هنا يتم تمرير البيانات (الاسم واللون) للخلف عند الحفظ
                          final categoryName = _categoryNameController.text;
                          if (categoryName.isNotEmpty) {
                            // إغلاق الواجهة وتمرير البيانات المسترجعة
                            Navigator.pop(context, {'name': categoryName, 'color': _selectedColor});
                          }
                        },
                        icon: const Icon(Icons.folder, color: Colors.white, size: 20),
                        label: const Text(
                          'اضافة التصنيف',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5C6BC0), // لون الزر الأزرق
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24), // حواف دائرية (Stadium)
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ويدجت مساعدة لبناء دائرة اللون
  Widget _buildColorCircle(Color color) {
    final isSelected = _selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: const Color(0xFF5C6BC0), width: 2)
              : Border.all(color: Colors.black.withOpacity(0.05), width: 1),
        ),
        child: isSelected
            ? const Icon(Icons.check, color: Colors.white, size: 24)
            : null,
      ),
    );
  }
}
