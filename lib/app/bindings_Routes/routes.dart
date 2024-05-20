import 'package:get/get_navigation/src/routes/get_route.dart';
// Import the bookings.dart file
import '../UI/login/login.dart';


class Pages {
  static List<GetPage> all = [
    GetPage(name: "/", page: ()=> const Login()),
  ];
}
