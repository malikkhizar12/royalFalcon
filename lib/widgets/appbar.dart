import 'package:flutter/material.dart';
import 'package:royal_falcon_limousine/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  final Color bgColor;
  const CustomAppBar(
      { Key? key,
        this.bgColor =  backgroundColor,
        required this.title,
        this.color = const Color(0xFF2D343C)
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      leading: SizedBox(
        height: 20,
        width: 20,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color,
          ),
          margin: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: Color(0xFFCF9D2C)),
            iconSize: 23,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
