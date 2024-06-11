import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/api_functions.dart';
import '../../widgets/custom_end_drawer.dart';
import '../../widgets/home_screen_categories.dart';
import '../../widgets/searchbar.dart';
import '../Explore/explore_main.dart';
import '../GetAway/getaway_main.dart';
import '../Rides/Rides.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GetApiFunctions getApiFunctions = GetApiFunctions();

  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }
  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }
  loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name');
      userEmail = prefs.getString('user_email');
    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
    );

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: CustomEndDrawer(),
        backgroundColor: const Color(0xFF22262A),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.08, // Set opacity to 10%
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/home_background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      margin: EdgeInsets.only(top: 15.h, bottom: 20.h),
                      height: 49.h,
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
                                icon:
                                    Image.asset('images/notificaton_icon.png'),
                              ),
                              IconButton(
                                onPressed: () {
                                  scaffoldKey.currentState?.openEndDrawer();
                                },
                                icon: Image.asset('images/menu_icon.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello ${capitalizeFirstLetter(userName ?? "Guest")}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          userEmail ?? "Your Email", // Display "Guest" if userName is null
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        const ElevatedSearchBar(
                          hintText: "Search",
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF3A3E41),
                            border: Border.all(color: Colors.white, width: 0.4),
                          ),
                          height: 388.h,
                          width: 381.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: HomeScreenCategories(
                                      categoryTitle: 'Rides',
                                      imagePath: 'images/wheels.png',
                                      onTap: () => Get.to(Rides()),
                                    ),
                                  ),
                                  Expanded(
                                    child: HomeScreenCategories(
                                      categoryTitle: 'Getaway',
                                      imagePath: 'images/getaway.png',
                                      onTap: () => Get.to(GetAway()),
                                    ),
                                  ),
                                  Expanded(
                                    child: HomeScreenCategories(
                                      categoryTitle: 'Explore',
                                      imagePath: 'images/explore.png',
                                      onTap: () => Get.to(ExploreMain()),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              const Row(
                                children: [
                                  Expanded(
                                    child: HomeScreenCategories(
                                      categoryTitle: 'Stay Local',
                                      imagePath: 'images/stay_local.png',
                                    ),
                                  ),
                                  Expanded(
                                    child: HomeScreenCategories(
                                      categoryTitle: 'Passport pro',
                                      imagePath: 'images/passport_pro.png',
                                    ),
                                  ),
                                  Expanded(
                                    child: HomeScreenCategories(
                                      categoryTitle: 'Invest in',
                                      imagePath: 'images/invest.png',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              const Row(
                                children: [
                                  Expanded(
                                    child: HomeScreenCategories(
                                      categoryTitle: 'Partner up',
                                      imagePath: 'images/partner.png',
                                    ),
                                  ),
                                  Expanded(
                                    child: HomeScreenCategories(
                                      categoryTitle: 'More services',
                                      imagePath: 'images/more_services.png',
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
