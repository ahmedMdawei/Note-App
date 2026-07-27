import 'package:flutter/material.dart';

/// ويدجت [NoteCard] تمثل بطاقة الملاحظة الفردية.
/// مصممة لتكون Stateless لاستقبال البيانات وعرضها فقط.
class NoteCard extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String dateText;

  final List<String> contentLines;

  final List<String> tags;

  final VoidCallback? onDelete;

  const NoteCard({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.dateText,
    required this.contentLines,
    this.tags = const [],
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. ترويسة البطاقة (العنوان وأيقونة الحذف)
          _buildHeader(),
          const SizedBox(height: 12.0),

          // 2. محتوى البطاقة (النصوص أو القوائم)
          _buildContent(context),

          const SizedBox(height: 16.0),

          // 3. تذييل البطاقة (التاريخ والوسوم)
          _buildFooter(),
        ],
      ),
    );
  }

  /// تبني الترويسة التي تحتوي على العنوان وأيقونة الحذف.
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        // العنوان
        Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16.0, // تصغير الخط قليلاً ليتناسب مع التصميم
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onDelete,
          child: const Icon(
            Icons.delete_outline,
            color: Colors.black54,
            size: 22.0,
          ),
        ),

      ],
    );
  }


  Widget _buildContent(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: contentLines.map((line) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4.0), // تقليل المسافة لتطابق التصميم
          child: Text(
            textAlign: TextAlign.right,
            line,
            style: TextStyle(

              color: Colors.black87.withOpacity(0.7), // لون النص أفتح قليلاً من العنوان
              fontSize: 13.0,
              height: 1.5,
            ),
          ),
        );
      }).toList(),
    );
  }


  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (tags.isNotEmpty)
          Wrap(
            spacing: 6.0,
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14.0,
                  ),
                ),
              );
            }).toList(),
          ),
          Text(
          // textAlign: TextAlign.end,
          dateText,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
