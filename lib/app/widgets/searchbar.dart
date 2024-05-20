import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_falcon_limousine/app/utils/colors.dart';

class ElevatedSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;
  final Color? fillcolor;// Consistent variable naming convention
  final Color? textcolor;// Consistent variable naming convention


  const ElevatedSearchBar({
    Key? key,
    this.onChanged,
    this.textcolor=Colors.grey,
    this.hintText = 'Search Car',
    this.fillcolor=Colors.white// Default hint text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),


      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            cursorColor: Colors.white,
            textAlign: TextAlign.center, // Center the text and hint text
            style: TextStyle(
              color: textcolor,
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
                  color: textcolor,
                ),
              ),
              hintText: hintText, // Corrected the variable name
              hintStyle: TextStyle(
                color: textcolor,
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
              filled: true,
              fillColor: fillcolor,
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
