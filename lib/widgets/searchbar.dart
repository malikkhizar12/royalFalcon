import 'package:flutter/material.dart';
import 'package:royal_falcon_limousine/colors.dart';
class ElevatedSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const ElevatedSearchBar({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15,bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0x005e5b5b).withOpacity(0.2), // Set outer shadow color
            spreadRadius: 5, // Set outer spread radius
            blurRadius: 7.5, // Set outer blur radius
            offset: const Offset(0, 1), // Set outer offset
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor, // Set background color
            borderRadius: BorderRadius.circular(20),

          ),
          child: TextField(
            style: const TextStyle(
              color: Colors.grey
            ),
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10, bottom: 10, right: 10),
                child: Image.asset('images/search_icon.png',height: 25,width: 25, color: Colors.grey,),
              ),
              hintText: 'Search Car',
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              filled: true,
              fillColor: const Color(0xFF22272B),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),
        ),
      ),
    );
  }
}
