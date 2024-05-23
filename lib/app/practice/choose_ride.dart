// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:royal_falcon_limousine/app/widgets/starRating.dart';
// import '../UI/Rides/models/abudhabi_list_model.dart';
// import '../UI/Rides/models/dubai_list_model.dart';
// import '../controllers/airport_animation_controller.dart';
// import '../widgets/appbarcustom.dart';
//
// class AirportBookings extends StatefulWidget {
//   @override
//   _AirportBookingsState createState() => _AirportBookingsState();
// }
//
// class _AirportBookingsState extends State<AirportBookings> {
//   String selectedLocation = 'Dubai';
//   final AirportAnimationController animationController =
//   Get.put(AirportAnimationController());
//
//   final List<DubaiListModel> dubaiRides = [
//     DubaiListModel(
//       imageUrl: 'images/car_image.png',
//       name: 'Lexus ES 300H',
//       starRating: 4.8,
//       totalRatings: 4.8,
//       totalReviews: 150,
//       price: '100 AED',
//     ),
//     DubaiListModel(
//       imageUrl: 'images/car_image.png',
//       name: 'Mercedes Benz S Class',
//       starRating: 4.8,
//       totalRatings: 4.8,
//       totalReviews: 150,
//       price: '225 AED',
//     ),
//     DubaiListModel(
//       imageUrl: 'images/car_image.png',
//       name: 'Chevrolet Malibu',
//       starRating: 4.8,
//       totalRatings: 4.8,
//       totalReviews: 150,
//       price: '225 AED',
//     ),
//     DubaiListModel(
//       imageUrl: 'images/car_image.png',
//       name: 'Toyota Previa',
//       starRating: 4.8,
//       totalRatings: 4.8,
//       totalReviews: 150,
//       price: '200 AED',
//     ),
//   ];
//
//   final List<AbuDhabiListModel> abuDhabiRides = [
//     AbuDhabiListModel(
//       imageUrl: 'images/car_image.png',
//       name: 'Toyota Camry',
//       starRating: 4.8,
//       totalRatings: 4.8,
//       totalReviews: 150,
//       price: '150 AED',
//     ),
//     AbuDhabiListModel(
//       imageUrl: 'images/car_image.png',
//       name: 'BMW X5',
//       starRating: 4.8,
//       totalRatings: 4.8,
//       totalReviews: 150,
//       price: '275 AED',
//     ),
//     AbuDhabiListModel(
//       imageUrl: 'images/car_image.png',
//       name: 'Audi A6',
//       starRating: 4.8,
//       totalRatings: 4.8,
//       totalReviews: 150,
//       price: '250 AED',
//     ),
//     AbuDhabiListModel(
//       imageUrl: 'images/car_image.png',
//       name: 'Nissan Altima',
//       starRating: 4.8,
//       totalRatings: 4.8,
//       totalReviews: 150,
//       price: '175 AED',
//     ),
//   ];
//
//   List<dynamic> getSelectedRidesList() {
//     return selectedLocation == 'Dubai' ? dubaiRides : abuDhabiRides;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       animationController.startAnimation();
//     });
//   }
//
//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF22272B),
//       body: Column(
//         children: [
//           const appbarcustom(title: 'Choose your ride'),
//           const SizedBox(height: 16),
//           FractionallySizedBox(
//             widthFactor: 0.75,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: LocationButton(
//                     text: 'Dubai',
//                     isSelected: selectedLocation == 'Dubai',
//                     onTap: () {
//                       setState(() {
//                         selectedLocation = 'Dubai';
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: LocationButton(
//                     text: 'Abu Dhabi',
//                     isSelected: selectedLocation == 'Abu Dhabi',
//                     onTap: () {
//                       setState(() {
//                         selectedLocation = 'Abu Dhabi';
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               itemCount: getSelectedRidesList().length,
//               itemBuilder: (context, index) {
//                 return Obx(() {
//                   return AnimatedContainer(
//                     duration: Duration(milliseconds: 400 + (index * 250)),
//                     curve: Curves.decelerate,
//                     transform: Matrix4.translationValues(
//                         animationController.myAnimation.value ? 0 : 400, 0, 0),
//                     child: selectedLocation == 'Dubai'
//                         ? RideCardDubai(package: dubaiRides[index])
//                         : RideCardAbudhabi(package: abuDhabiRides[index]),
//                   );
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
