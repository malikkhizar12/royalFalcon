import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/appbarcustom.dart';
import '../../widgets/searchbar.dart';
import 'explore_list.dart';
import 'getaway_packages.dart';

class GetAway extends StatelessWidget {
  const GetAway({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF22272B),
        body: ListView(
          children: [
            const appbarcustom(),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find Your Dream Place",
                    style: TextStyle(color: Colors.white, fontSize: 26.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ElevatedSearchBar(
                    hintText: "Search",
                    fillcolor: Color(0xFFFFBC07),
                    textcolor: Colors.white,
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 100.w, // adjust the width of your list items
                          margin: const EdgeInsets.all(8),
                          child: const Center(child: Text("Australia")),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Most Visited",
                      style: TextStyle(color: Colors.white, fontSize: 22.sp),
                    ),
                  ),
                  SizedBox(
                    height: 239.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return const ExploreCard(
                          imageUrl: 'https://via.placeholder.com/150',
                          title: 'Dubai Safari Park',
                          location: 'Dubai',
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Text(
                      "Packages",
                      style: TextStyle(color: Colors.white, fontSize: 22.sp),
                    ),
                  ),
                ],
              ),
            ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 400, // or any other fixed height
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFF35383B),
                      ),
                      child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (BuildContext context, index) {
                            return const PackagesCard(
                              imageUrl: 'https://via.placeholder.com/150',
                              title: '3 days Package',
                              duration: '6 Days Trip',
                              price: 'AED 80 / Person',
                              rating: 4.5,
                            );

                          }
                          ),
                    ),
                  )

          ],
        ),
      ),
    );
  }
}
