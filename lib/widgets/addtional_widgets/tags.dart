import 'package:flutter/material.dart';
import 'package:note_app/screens/add_category.dart';

class Tags extends StatelessWidget {
  const Tags({super.key});

  @override
  Widget build(BuildContext context) {
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
              icon: const Icon(Icons.add, color: Color(0xFF2196F3), size: 20),
              onPressed: () async {
                // نستخدم await لانتظار البيانات العائدة من الواجهة
                final result = await showModalBottomSheet<Map<String, dynamic>>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return const AddCategoryBottomSheet();
                  },
                );

                // التحقق مما إذا كان المستخدم قد أضاف تصنيفاً بالفعل
                if (result != null) {
                  final newCategoryName = result['name'];
                  final newCategoryColor = result['color'];
                }
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

