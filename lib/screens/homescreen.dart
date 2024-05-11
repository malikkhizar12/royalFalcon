import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royal_falcon_limousine/screens/otp_verification_screen.dart';
import 'package:royal_falcon_limousine/widgets/searchbar.dart';
import '../bindings/booking_binding.dart';
import '../widgets/custom_end_drawer.dart';
import '../widgets/home_screen_categories.dart';
import 'bookings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;

  void toggleDrawer(bool isOpen) {
    setState(() {
      isDrawerOpen = isOpen;
    });
  }
  final scaffoldkey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        endDrawer: CustomEndDrawer(),
        backgroundColor: const Color(0xFF22262A),
        body:
            SingleChildScrollView(

              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF22272B),
                        borderRadius: BorderRadius.circular(4)
                    ),
                      margin: EdgeInsets.only(top: 35.h, bottom: 20.h),
                      padding:EdgeInsets.symmetric(horizontal: 30.w),
                      height: 49,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/home_icon.png'),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Handle notifications button press
                                },
                                icon: Image.asset('images/notificaton_icon.png'),
                              ),
                              IconButton(
                                onPressed: () {
                                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                                    if (scaffoldkey.currentState != null) {
                                      scaffoldkey.currentState!.openEndDrawer();
                                    } else {
                                      print("ScaffoldState is null");
                                    }
                                  });
                                },

                                icon: Image.asset('images/menu_icon.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 30.w),

                   child: Column(
                     children: [
                       Container(
                         alignment: Alignment.topLeft,
                         child: Text('Hello Khizar!',
                           textAlign: TextAlign.left,
                           style: TextStyle(
                                fontSize: 20.sp,
                               fontWeight: FontWeight.w600,
                             color: Colors.white
                         ),
                         ),
                       ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('taimoor12@gmail.com',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white
                            ),
                          ),
                        ),
                       SizedBox(height: 20.h,),
                       const ElevatedSearchBar(hintText: "Search",),
                       SizedBox(height: 20.h,),
                       Container(
                         color: const Color(0xFF3A3E41),
                            height:388.h,
                            width: 381.w,

                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30.h,),
                                   Row(
                                    children: [

                                      Expanded(
                                        child: HomeScreenCategories(
                                          categoryTitle: 'Fleets', // The text for the category
                                          imagePath: 'images/wheels.png', // Path to the image
                                          onTap: () {
                                            Get.to(const BookingsList(), binding: BookingBinding()); // Navigation to target page
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: HomeScreenCategories(
                                          categoryTitle: 'Getaway', // The text for the category
                                          imagePath: 'images/getaway.png', // Path to the image
                                          onTap: () {
                                            Get.to( ()=>  OtpVerification()); // Replace with your desired page
                                            // Get.to(const CarsPage()); // Replace with your desired page
                                          },
                                        ),
                                      ),
                                      const Expanded(
                                        child: HomeScreenCategories(
                                          categoryTitle: 'Explore', // The text for the category
                                          imagePath: 'images/explore.png', // Path to the image

                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  const Row(
                                    children: [
                                      Expanded(
                                        child: HomeScreenCategories(
                                          categoryTitle: 'Stay Local', // The text for the category
                                          imagePath: 'images/stay_local.png', // Path to the image
                                        ),
                                      ),
                                      Expanded(
                                        child: HomeScreenCategories(
                                          categoryTitle: 'Passport pro', // The text for the category
                                          imagePath: 'images/passport_pro.png', // Path to the image
                                        ),
                                      ),
                                      Expanded(
                                        child: HomeScreenCategories(
                                          categoryTitle: 'Invest in', // The text for the category
                                          imagePath: 'images/invest.png', // Path to the image
                                        ),
                                      ),



                                      // Add more Expanded widgets for other features
                                    ],
                                  ),
                                  SizedBox(height: 20.h),

                                   Row(
                                    children: [

                                      const Expanded(
                                        child: HomeScreenCategories(
                                          categoryTitle: 'Partner up', // The text for the category
                                          imagePath: 'images/partner.png', // Path to the image
                                        ),
                                      ),
                                      const Expanded(
                                        child: HomeScreenCategories(
                                          categoryTitle: 'More services', // The text for the category
                                          imagePath: 'images/more_services.png', // Path to the image
                                        ),
                                      ),
                                     Container(
                                       margin: EdgeInsets.symmetric(horizontal: 25.w),
                                        width: 77.h,
                                       height: 67.h,
                                      ),
                                      // Expanded(
                                      //   child: HomeScreenCategories(
                                      //     categoryTitle: 'Who we are!', // The text for the category
                                      //     imagePath: 'images/more_services.png', // Path to the image
                                      //   ),
                                      // ),

                                      // Add more Expanded widgets for other features
                                    ],
                                  ),

                                ],
                              ),

                          ),
                     ],
                   ),
                 ),



                ],
              ),
            ),
      ),
    );
  }
}


