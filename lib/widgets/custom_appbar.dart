import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ملاحظاتي", style: TextStyle(
                  fontSize: 28
                ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.search,
              size: 30,))
              ],
      ),
    );
  }
}
