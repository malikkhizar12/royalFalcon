import 'package:get/get_navigation/src/routes/get_route.dart';
// Import the bookings.dart file
import 'package:royal_falcon_limousine/screens/login.dart';

import '../bindings/booking_binding.dart';
import '../screens/bookings.dart';

class Pages {
  static List<GetPage> all = [
    GetPage(name: "/", page: ()=> const Login()),
    GetPage(name: "/bookinglist", page: ()=> const BookingsList(), binding: BookingBinding()), // Define the "/bookinglist" route
  ];
}
