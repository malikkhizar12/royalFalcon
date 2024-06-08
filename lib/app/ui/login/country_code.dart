import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../home_screen/homescreen.dart';
import '../../utils/colors.dart';

class CountryCodes extends StatelessWidget {
  const CountryCodes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:                       ElevatedButton(
          onPressed: () {
            Get.to(const HomeScreen());
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor), // Set button background color
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero), // Set padding to zero
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Expand tap target to the size of the button
            minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 48)), // Set minimum size to full width and 48 height
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13), // Set corner radius to 13
              ),
            ),
          ),
          child: Container(
            width: double.infinity, // Ensure button takes up full width
            height: 48.h, // Set desired height
            alignment: Alignment.center,
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

      ),
    );
  }
}
