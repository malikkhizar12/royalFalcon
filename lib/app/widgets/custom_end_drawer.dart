import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../UI/profile.dart';

class CustomEndDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CustomEndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor:  const Color(0xFF3A3E41),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            Image.asset('images/home_icon.png'),

            Container(
              padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h,bottom: 10.h),
              margin: EdgeInsets.only(left: 10.w,right: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFF333639),
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(const ProfileScreen());

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,

                        ),
                        ), // Button text
                        Image.asset('images/nav_arrow_right.png')
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your onPressed callback here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('My Booking',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,

                          ),
                        ), // Button text
                        Image.asset('images/nav_arrow_right.png')
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your onPressed callback here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Favaurite',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,

                          ),
                        ), // Button text
                        Image.asset('images/nav_arrow_right.png')
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your onPressed callback here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('RFL wallet',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,

                          ),
                        ), // Button text
                        Image.asset('images/nav_arrow_right.png')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h,),
            Container(
              padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h,bottom: 10.h),
              margin: EdgeInsets.only(left: 10.w,right: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFF333639),
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      // Add your onPressed callback here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Region',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,

                          ),
                        ), // Button text
                        Image.asset('images/nav_arrow_right.png')
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your onPressed callback here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Currency',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,

                          ),
                        ), // Button text
                        Image.asset('images/nav_arrow_right.png')
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your onPressed callback here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Language',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,

                          ),
                        ), // Button text
                        Image.asset('images/nav_arrow_right.png')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h,),
            Container(
              padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h,bottom: 10.h),
              margin: EdgeInsets.only(left: 10.w,right: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFF333639),
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      // Add your onPressed callback here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Help & Support',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,

                          ),
                        ), // Button text
                        Image.asset('images/nav_arrow_right.png')
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your onPressed callback here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Terms & Conditions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,

                          ),
                        ), // Button text
                        Image.asset('images/nav_arrow_right.png')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h,),
            
            Center(
              child: Text('Plan your Adventure',
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color?>(Color(0xFFFFBC07))
                ),
                  onPressed: (){},
                  child: Text("Sign Up Now",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp
                  ),)

              ),
            )
          ],
        ),
      ),
    );
  }
}
