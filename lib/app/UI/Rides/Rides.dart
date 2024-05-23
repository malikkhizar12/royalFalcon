import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/booking_type.dart';
import '../../widgets/custom_end_drawer.dart';
import '../../widgets/starRating.dart';

class Rides extends StatelessWidget {
  Rides({super.key});
  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF22272B),
        key: scaffoldkey,
        endDrawer: CustomEndDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/rides_cover.png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(height: 150.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Best Sellings",
                                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "View All",
                                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 371.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF2D343C),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                    width: 250.w,
                                    margin: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          height: 200.h,
                                          width: 230.w,
                                          child: Center(
                                            child: Image.asset("images/lexus300.png"),
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          "Lexus ES 300H",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        StarRating(
                                          rating: 4,
                                          size: 20.sp,
                                          color: Color(0xFFFF9A3E),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 4.0),
                                          child: Text(
                                            "4.8",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 15.h),
                                        Row(
                                          children: [
                                            Text(
                                              'From ',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            Text(
                                              'AED 425',
                                              style: TextStyle(
                                                color: Color(0xFFCF9D2C),
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            Text(
                                              ' / Person',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.22,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: BookingType(),
                    ),
                  ),
                  Positioned(
                    top: 20.h,
                    left: 20.w,
                    child: SizedBox(
                      height: 60.h,
                      width: 60.w,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF2D343C),
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back, color: Color(0xFFCF9D2C)),
                          iconSize: 23.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
