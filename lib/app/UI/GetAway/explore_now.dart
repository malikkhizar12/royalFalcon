import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/appbarcustom.dart';
import 'models/gallery_tab_model.dart';

class ExploreNow extends StatefulWidget {
  const ExploreNow({super.key});

  @override
  State<ExploreNow> createState() => _ExploreNowState();
}

class _ExploreNowState extends State<ExploreNow> with TickerProviderStateMixin {
  late TabController _tabController;
  double _tabBarViewHeight = 123.h;
  double _mainContainerHeight= 380.h;

  final List<ImageModel> _images = [
    ImageModel(imageUrl: 'images/dubai_safari.jpg'),
    ImageModel(imageUrl: 'images/home_background.jpg'),
    ImageModel(imageUrl: 'images/Explore_now.png'),
    ImageModel(imageUrl: 'images/dubai_safari.jpg'),
    ImageModel(imageUrl: 'images/home_background.jpg'),
    ImageModel(imageUrl: 'images/Explore_now.png'),
    ImageModel(imageUrl: 'images/dubai_safari.jpg'),
    ImageModel(imageUrl: 'images/home_background.jpg'),
    ImageModel(imageUrl: 'images/Explore_now.png'),

  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabBarViewHeight = _tabController.index == 1 ? 220.h : 123.h;
        _mainContainerHeight = _tabController.index == 1 ? 460.h : 380.h;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Explore_now.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const appbarcustom(
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
                child: Container(
                  height: _mainContainerHeight,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(200, 128, 128, 138),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset('images/location_icon.png'),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "Dubai Safari park",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Dubai ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                "AED 50",
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
                      if (_tabController.index != 1) // Hide this row when Gallery tab is selected
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 75,
                              height: 40, // Adjust the width as needed
                              child: Stack(
                                children: List.generate(3, (index) {
                                  return Positioned(
                                    left: index *
                                        18.0, // Adjust this value for the desired overlap
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
                        labelColor: Color(0xFFFFBC07),
                        unselectedLabelColor: Colors.white,
                        indicatorColor: Color(0xFFFFBC07),
                        controller: _tabController,
                        tabs: const [
                          Tab(text: "Overview"),
                          Tab(text: "Gallery"),
                          Tab(text: "Facilities"),
                        ],
                      ),
                      SizedBox(
                        height: _tabBarViewHeight,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Dubai safari park is the new and updated version of Dubai zoo "
                                    "which now offers you the luxury of exploring and discovering up "
                                    "close about 3000 animals of over 250 species from across the world in "
                                    "an ecofriendly and safe environment where the animals are kept in an "
                                    "open undisturbed habitat in a 119 acres facility.",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                height: availableHeight,
                                child: GridView.builder(
                                  itemCount: _images.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 1.4,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Image.asset(
                                      _images[index].imageUrl,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Padding(
                              padding:  EdgeInsets.only(top: 8.0),
                              child: Text(
                                "1. Swimming Pool\n2. Jeep rally\n 3. Travel Insurance\n 4. Accomodation\n 5. Health and wellness\n 6. Pick and Drop",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h,),
                      ElevatedButton(
                        onPressed: () {
                          // Get.to(()=>ExploreNow());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFBC07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
