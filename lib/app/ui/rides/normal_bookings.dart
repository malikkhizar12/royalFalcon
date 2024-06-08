import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_falcon_limousine/app/ui/rides/rides_on_selected_location.dart';
import 'package:royal_falcon_limousine/app/utils/colors.dart';
import '../../widgets/appbarcustom.dart';
import '../../widgets/destination_tiles_on_map.dart';
import '../../widgets/starRating.dart';
import 'location_buttons.dart';
import 'models/normal_booking_car_model.dart';

class NormalBookings extends StatefulWidget {
  const NormalBookings({super.key});

  @override
  State<NormalBookings> createState() => _NormalBookingsState();
}

class _NormalBookingsState extends State<NormalBookings> {
  String selectedLocation = 'Dubai';
  String? pickupLocation;
  String? dropoffLocation;
  final List<CarModel> cars = CarModel.normal_booking_cars();

  void _checkLocationsAndNavigate() {
    if (pickupLocation != null && dropoffLocation != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const YourRides()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Getting the screen height
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isSmallScreen = screenHeight < 700;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppbarCustom(title: 'Select Your Destination'),
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
                              _checkLocationsAndNavigate();
                            },
                          ),
                          SizedBox(height: 10.h),
                          DestinationTile(
                            title: 'Select Dropoff Location',
                            onSelected: (location) {
                              setState(() {
                                dropoffLocation = location;
                              });
                              _checkLocationsAndNavigate();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              color: const Color(0xFF333639),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
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
            Flexible(
              child: SizedBox(
                height: isSmallScreen ? 320.h : 371.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cars.length,
                  itemBuilder: (BuildContext context, int index) {
                    final car = cars[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D343C),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 8.w : 10.w,
                        vertical: isSmallScreen ? 8.h : 10.h,
                      ),
                      width: isSmallScreen ? 220.w : 250.w,
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            height: isSmallScreen ? 130.h : 150.h,
                            width: isSmallScreen ? 200.w : 230.w,
                            child: Center(
                              child: Image.asset(car.imageUrl),
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 8.h : 10.h),
                          Text(
                            car.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 18.sp : 20.sp,
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 3.h : 5.h),
                          StarRating(
                            rating: car.rating,
                            size: isSmallScreen ? 18.sp : 20.sp,
                            color: const Color(0xFFFF9A3E),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              car.rating.toStringAsFixed(1),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isSmallScreen ? 16.sp : 18.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 10.h : 12.h),
                          Row(
                            children: [
                              Text(
                                'From ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: isSmallScreen ? 14.sp : 16.sp,
                                ),
                              ),
                              Text(
                                '${car.currency} ${car.price}',
                                style: TextStyle(
                                  color: const Color(0xFFCF9D2C),
                                  fontSize: isSmallScreen ? 14.sp : 16.sp,
                                ),
                              ),
                              Text(
                                ' / Person',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: isSmallScreen ? 14.sp : 16.sp,
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
            ),
          ],
        ),
      ),
    );
  }
}



