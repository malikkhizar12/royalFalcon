import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royal_falcon_limousine/app/controllers/rides_animation_controller.dart';
import 'package:royal_falcon_limousine/app/ui/rides/rides_main_car_card.dart';
import '../../utils/colors.dart';
import '../../widgets/booking_type.dart';
import '../../widgets/custom_end_drawer.dart';
import 'location_buttons.dart';

class Rides extends StatefulWidget {
  Rides({super.key});

  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  String selectedLocation = 'Dubai';
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final RidesAnimationController getawayAnimationController =
  Get.put(RidesAnimationController());

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
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isSmallScreen = screenHeight < 700;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        key: scaffoldkey,
        endDrawer: CustomEndDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(height: 100.h),
                      Container(
                        color: const Color(0xFF333639),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: LocationButton(
                                text: 'Dubai',
                                isSelected: selectedLocation == 'Dubai',
                                onTap: () {
                                  setState(() {
                                    selectedLocation = 'Dubai';
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: LocationButton(
                                text: 'Abu Dhabi',
                                isSelected: selectedLocation == 'Abu Dhabi',
                                onTap: () {
                                  setState(() {
                                    selectedLocation = 'Abu Dhabi';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                            decoration: const BoxDecoration(
                              color: Color(0xFF35383B),
                            ),
                            child: Column(
                              children: [
                                 Text(
                                  "Explore More Popular Cars",
                                  style: TextStyle(color: Colors.white,fontSize: 25.sp),
                                ),
                                SizedBox(height: 8.h,),
                                Obx(() {
                                  final myAnimation = getawayAnimationController
                                      .myAnimation.value;
                                  return GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.75, // Adjust the aspect ratio as needed
                                      mainAxisSpacing: 8.h,
                                    ),
                                    itemCount: 8,
                                    itemBuilder: (context, index) {
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 400 + (index * 250)),
                                        curve: Curves.easeInCubic,
                                        transform: Matrix4.translationValues(
                                            myAnimation ? 0 : width, 0, 0),
                                        child: const RidesMainCard(
                                          imageUrl: 'images/Lexus_ES_300H.png',
                                          name: 'Lexus ES 300H',
                                          baggage: 3,
                                          price: 250,
                                          rating: 4.0,
                                          persons: 4,
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.18,
                    left: 0,
                    right: 0,
                    child: const Center(
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
                          icon: const Icon(Icons.arrow_back,
                              color: Color(0xFFCF9D2C)),
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
