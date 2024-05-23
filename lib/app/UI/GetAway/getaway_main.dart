import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royal_falcon_limousine/app/controllers/getaway_animation_controller.dart';
import '../../widgets/appbarcustom.dart';
import '../../widgets/searchbar.dart';
import 'explore_list.dart';
import 'getaway_packages.dart';
import 'models/explore_card_model.dart';

class GetAway extends StatefulWidget {
  GetAway({super.key});

  @override
  State<GetAway> createState() => _GetAwayState();
}

class _GetAwayState extends State<GetAway> {
  final GetawayAnimationController getawayAnimationController =
      Get.put(GetawayAnimationController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getawayAnimationController.startAnimation();
    });
  }
  @override
  void dispose() {
    getawayAnimationController.dispose(); // Dispose of the animation controller
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final List<ExploreCardModel> exploreCards = [
      ExploreCardModel(
        imageUrl:
            'https://i2.wp.com/www.alltherooms.com/blog/wp-content/uploads/2018/09/Feature-Beaches-in-the-Maldives-By-Nikolay-007.jpg?fit=1000%2C667&ssl=1',
        title: 'Beautiful Beach',
        location: 'Maldives',
      ),
      ExploreCardModel(
        imageUrl:
            'https://www.frost.com/wp-content/uploads/2018/02/Dubai-Tourism-1080x675.jpg',
        title: 'Mountain View',
        location: 'Switzerland',
      ),
      // Add more ExploreCardModel instances as needed
    ];
    final List<String> countries = [
      'Australia',
      'Dubai',
      'Canada',
      'Saudi Arabia',
      'Yemen'
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF22272B),
        body: ListView(
          children: [
            const appbarcustom(
              title: 'Getaway',
            ),
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
                      itemCount: countries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 100.w, // adjust the width of your list items
                          margin: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              countries[index], // Get the text from the list
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
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
                      itemCount: exploreCards.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExploreCard(
                          exploreCard: exploreCards[index],
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF35383B),
                ),
                child: Obx(() {
                  final myAnimation =
                      getawayAnimationController.myAnimation.value;
                  return ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 400 + (index * 250)),
                        curve: Curves.easeIn,
                        transform: Matrix4.translationValues(
                            myAnimation ? 0 : width, 0, 0),
                        child: const PackagesCard(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRSfiks-mlGyMj_fD3wJmR71Qfnu2rJ3_-ajn3rqb-DC1yuAFuWNjWxM8HbSjqqIHN3TA&usqp=CAU',
                          title: '3 days Package',
                          duration: '6 Days Trip',
                          price: 'AED 80 / Person',
                          rating: 4.5,
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
