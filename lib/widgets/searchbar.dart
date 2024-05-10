import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_falcon_limousine/colors.dart';

class ElevatedSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hintText; // Consistent variable naming convention

  const ElevatedSearchBar({
    Key? key,
    this.onChanged,
    this.hintText = 'Search Car', // Default hint text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0x005e5b5b).withOpacity(0.2), // Set outer shadow color
            spreadRadius: 3, // Set outer spread radius
            blurRadius: 7.5, // Set outer blur radius
            offset: Offset(0, 1), // Set outer offset
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: backgroundColor, // Set background color
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            textAlign: TextAlign.center, // Center the text and hint text
            style: TextStyle(
              color: Colors.grey,
            ),
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                  top: 10.h,
                  bottom: 10.h,
                  right: 18.w, // Adjusted padding on the right for the icon
                ),
                child: Image.asset(
                  'images/search_icon.png',
                  height: 23.h,
                  width: 23.w,
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),
              hintText: hintText, // Corrected the variable name
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.7),
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(42),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w), // Increased horizontal padding for centering
            ),
          ),
        ),
      ),
    );
  }
}
