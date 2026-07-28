import 'package:flutter/material.dart';

class FloatingAddNoteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatingAddNoteButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(
        Icons.add_circle_outline,
        color: Colors.white,
        size: 24,
      ),
      label: const Text(
        'إضافة ملاحظة جديدة',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 12, 44, 98),
        surfaceTintColor: const Color.fromARGB(255, 12, 44, 98),
        elevation: 4,
        shadowColor: const Color.fromARGB(213, 16, 16, 75).withOpacity(0.4),

        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: const StadiumBorder(),
      ),
    );
  }
}
