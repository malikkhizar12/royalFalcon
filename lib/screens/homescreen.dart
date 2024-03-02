  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import '../bindings/booking_binding.dart';
  import '../widgets/custom_end_drawer.dart';
  import 'bookings.dart';

  import 'package:flutter/material.dart';
  import 'package:get/get.dart';

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

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(0xFF2D343C),
        body: Stack(
          children: [

            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 35),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 49,
                  color: const Color(0xFF22272B),
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
                              toggleDrawer(!isDrawerOpen); // Toggle the drawer state
                            },
                            icon: Icon(Icons.menu), // Use a built-in icon instead of an image
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to cars page
                                Get.to(const BookingsList(),binding: BookingBinding()); // Replace with your desired page
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF22272B),
                                        borderRadius: BorderRadius.circular(10),
                                        border:Border.all(color: Color(0xFFEFEFEF),width: 0.5)
                                    ),
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.all(8),
                                    child: const Center(
                                      child: Icon(
                                        Icons.car_repair_sharp,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Cars',
                                    style: TextStyle(fontSize: 11,
                                      fontWeight:FontWeight.w600 ,color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to cars page
                                // Get.to(const CarsPage()); // Replace with your desired page
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF22272B),
                                        borderRadius: BorderRadius.circular(10),
                                        border:Border.all(color: Color(0xFFEFEFEF),width: 0.5)
                                    ),
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.all(8),
                                    child: const Center(
                                      child: Icon(
                                        Icons.airplanemode_active,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Activities',
                                    style: TextStyle(fontSize: 11,
                                      fontWeight:FontWeight.w600 ,color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to cars page
                                // Get.to(const CarsPage()); // Replace with your desired page
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF22272B),
                                        borderRadius: BorderRadius.circular(10),
                                        border:Border.all(color: Color(0xFFEFEFEF),width: 0.5)
                                    ),
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.all(8),
                                    child: const Center(
                                      child: Icon(
                                        Icons.car_repair_sharp,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Visa',
                                    style: TextStyle(fontSize: 11,
                                      fontWeight:FontWeight.w600 ,color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to cars page
                                // Get.to(const CarsPage()); // Replace with your desired page
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF22272B),
                                        borderRadius: BorderRadius.circular(10),
                                        border:Border.all(color: Color(0xFFEFEFEF),width: 0.5)
                                    ),
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.all(8),
                                    child: const Center(
                                      child: Icon(
                                        Icons.car_repair_sharp,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Cars',
                                    style: TextStyle(fontSize: 11,
                                      fontWeight:FontWeight.w600 ,color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),


                          // Add more Expanded widgets for other features
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to cars page
                                // Get.to(const CarsPage()); // Replace with your desired page
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF22272B),
                                        borderRadius: BorderRadius.circular(10),
                                        border:Border.all(color: Color(0xFFEFEFEF),width: 0.5)
                                    ),
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.all(8),
                                    child: const Center(
                                      child: Icon(
                                        Icons.car_repair_sharp,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Cars',
                                    style: TextStyle(fontSize: 11,
                                      fontWeight:FontWeight.w600 ,color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to cars page
                                // Get.to(const CarsPage()); // Replace with your desired page
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF22272B),
                                        borderRadius: BorderRadius.circular(10),
                                        border:Border.all(color: Color(0xFFEFEFEF),width: 0.5)
                                    ),
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.all(8),
                                    child: const Center(
                                      child: Icon(
                                        Icons.car_repair_sharp,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Cars',
                                    style: TextStyle(fontSize: 11,
                                      fontWeight:FontWeight.w600 ,color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to cars page
                                // Get.to(const CarsPage()); // Replace with your desired page
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF22272B),
                                        borderRadius: BorderRadius.circular(10),
                                        border:Border.all(color: Color(0xFFEFEFEF),width: 0.5)
                                    ),
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.all(8),
                                    child: const Center(
                                      child: Icon(
                                        Icons.car_repair_sharp,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Cars',
                                    style: TextStyle(fontSize: 11,
                                      fontWeight:FontWeight.w600 ,color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to cars page
                                // Get.to(const CarsPage()); // Replace with your desired page
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF22272B),
                                        borderRadius: BorderRadius.circular(10),
                                        border:Border.all(color: Color(0xFFEFEFEF),width: 0.5)
                                    ),
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.all(8),
                                    child: const Center(
                                      child: Icon(
                                        Icons.car_repair_sharp,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Cars',
                                    style: TextStyle(fontSize: 11,
                                      fontWeight:FontWeight.w600 ,color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),


                          // Add more Expanded widgets for other features
                        ],
                      ),

                      // Add more rows for additional features
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: SizedBox(
                    width: 273,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        // Get.to(HomeScreen());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent), // Set transparent background color
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.zero),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 48)),
                        shadowColor: MaterialStateProperty.all<Color>(
                            const Color(0x613EEA52)), // Set shadow color
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFB17C0F),
                              Color(0xFF000000),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          child: const Text(
                            'Get 10% discount on your first ride',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Image.asset('images/map_pic.png'),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,

                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                ),
                height: MediaQuery.of(context).size.height * 0.22, // 22% of screen height
                child: Center(
                  child: Column(
                    children: [
                      Container(width: 100,height: 2,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white)
                      ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            if (isDrawerOpen)
              GestureDetector(
                onTap: () {
                  toggleDrawer(false); // Close drawer when tapped outside
                },
                child: Container(
                  color: Colors.transparent, // Make the rest of the screen tappable
                ),
              ),
            if (isDrawerOpen)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: CustomDrawer(
                  toggleDrawer: toggleDrawer,
                ),
              ),
          ],
        ),
      );
    }
  }
