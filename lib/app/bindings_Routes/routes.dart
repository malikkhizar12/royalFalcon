import 'package:get/get_navigation/src/routes/get_route.dart';
// Import the bookings.dart file
import '../UI/bookings.dart';
import '../UI/login/login.dart';
import '../bindings/booking_binding.dart';


class Pages {
  static List<GetPage> all = [
    GetPage(name: "/", page: ()=> const Login()),
    GetPage(name: "/bookinglist", page: ()=> const BookingsList(), binding: BookingBinding()), // Define the "/bookinglist" route
  ];
}
