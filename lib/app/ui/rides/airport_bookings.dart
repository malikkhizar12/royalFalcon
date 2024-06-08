import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_falcon_limousine/app/UI/Rides/ride_card_abudhabi.dart';
import 'package:royal_falcon_limousine/app/UI/Rides/ride_card_dubai.dart';
import '../../controllers/airport_animation_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/appbarcustom.dart';
import 'location_buttons.dart';
import 'models/abudhabi_list_model.dart';
import 'models/dubai_list_model.dart';

class AirportBookings extends StatefulWidget {
  @override
  _AirportBookingsState createState() => _AirportBookingsState();
}

class _AirportBookingsState extends State<AirportBookings> {
  String selectedLocation = 'Dubai';
  final AirportAnimationController animationController = Get.put(AirportAnimationController());

  List<dynamic> getSelectedRidesList() {
    return selectedLocation == 'Dubai' ? DubaiListModel.getDubaiRides() : AbuDhabiListModel.getAbuDhabiRides();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animationController.startAnimation();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  backgroundColor,
      body: Column(
        children: [
          const AppbarCustom(title: 'Choose your ride'),
          const SizedBox(height: 16),
          FractionallySizedBox(
            widthFactor: 0.75,
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
                const SizedBox(width: 8),
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
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: getSelectedRidesList().length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 400 + (index * 250)),
                    curve: Curves.decelerate,
                    transform: Matrix4.translationValues(
                        animationController.myAnimation.value ? 0 : 400, 0, 0),
                    child: selectedLocation == 'Dubai'
                        ? RideCardDubai(package: getSelectedRidesList()[index])
                        : RideCardAbudhabi(package: getSelectedRidesList()[index]),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
