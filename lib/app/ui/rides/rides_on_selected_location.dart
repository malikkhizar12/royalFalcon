import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/destination_tiles_on_map.dart';
import '../../utils/colors.dart';
import '../../widgets/appbarcustom.dart';

class YourRides extends StatefulWidget {
  const YourRides({super.key});

  @override
  State<YourRides> createState() => _YourRidesState();
}

class _YourRidesState extends State<YourRides> {
  String selectedLocation = 'Dubai';
  String? pickupLocation;
  String? dropoffLocation;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body:  Column(
            children: [
              const AppbarCustom(title: 'Your Rides'),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Container(
                  height: screenHeight * 0.38, // 40% of the screen height
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.map,
                            color: Colors.white,
                            size: 100,
                          ), // Placeholder for the map
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 10,
                        right: 10,
                        child: Column(
                          children: [
                            DestinationTile(
                              title: 'Select Pickup Location',
                              onSelected: (location) {
                                setState(() {
                                  pickupLocation = location;
                                });
                              },
                            ),
                            SizedBox(height: 10.h),
                            DestinationTile(
                              title: 'Select Dropoff Location',
                              onSelected: (location) {
                                setState(() {
                                  dropoffLocation = location;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
