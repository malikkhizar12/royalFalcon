import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/explore_most_visited_controller.dart';
import '../../widgets/appbarcustom.dart';
import '../../widgets/tab_bar.dart';


class MostVisited extends StatelessWidget {
  const MostVisited({super.key});

  @override
  Widget build(BuildContext context) {
    print("widget is buiding again");
    final ExploreMostVisitedController controller = Get.put(ExploreMostVisitedController());

    double appBarHeight = 60.h; // Assuming app bar height
    double tabBarHeight = 50.h; // Assuming tab bar height
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double availableHeight = MediaQuery.of(context).size.height -
        appBarHeight -
        tabBarHeight -
        bottomPadding -
        120.h; // Adjust this value based on other elements in your UI

    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:  BoxDecoration(
                image: const DecorationImage(
                  image:  AssetImage('images/most_visited.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              foregroundDecoration: BoxDecoration(
                color: Colors.black.withOpacity(0.66), // Adjust opacity here (0.5 for 50% opacity)
              ),
            ),
            const AppbarCustom(
              title: 'Explore Now',
            ),
            Positioned(
              bottom: 55,
              left: 25,
              right: 25,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                child: Obx(() => Container(
                  height: controller.mainContainerHeight.value,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(200, 128, 128, 138),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(

                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Image.asset('images/location_icon.png'),
                              SizedBox(width: 5.w),
                              Text(
                                "Sightseeing Tours",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                "AED 2550",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "/ Person",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      if (controller.tabController.index != 1)
                      // Hide this row when Gallery tab is selected
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 75,
                              height: 40, // Adjust the width as needed
                              child: Stack(
                                children: List.generate(3, (index) {
                                  return Positioned(
                                    left: index * 18.0, // Adjust this value for the desired overlap
                                    child: const CircleAvatar(
                                      backgroundImage: AssetImage('images/Explore_now.jpg'),
                                      radius: 15, // Adjust the radius as needed
                                    ),
                                  );
                                }),
                              ),
                            ),
                            Text(
                              "299+ people adventure",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                            const Spacer(),
                            const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFBC07),
                                  size: 20,
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFBC07),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      TabBar(

                        labelColor: const Color(0xFFFFBC07),
                        unselectedLabelColor: Colors.white,
                        indicatorColor: const Color(0xFFFFBC07),
                        controller: controller.tabController,
                        tabs: const [
                          Tab(text: "Overview"),
                          Tab(text: "Gallery"),
                          Tab(text: "Facilities"),
                        ],
                      ),
                      TabBarContent(
                        tabController: controller.tabController,
                        tabBarViewHeight: controller.tabBarViewHeight.value,
                        availableHeight: availableHeight,
                        images: controller.images,
                      ),
                      SizedBox(height: 8.h),
                      ElevatedButton(
                        onPressed: () {
                          // Navigation logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFBC07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
