import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:royal_falcon_limousine/app/ui/signup/signup.dart';
// Import the bookings.dart file
import '../UI/login/login.dart';


class Pages {
  static List<GetPage> all = [
    GetPage(name: "/", page: ()=>  SignupPage()),
  ];
}
