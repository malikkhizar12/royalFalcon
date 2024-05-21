import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../UI/Home_profile/homescreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../UI/Home_profile/homescreen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> login(String phoneNumber) async {
    isLoading.value = true;

    // Replace with your API endpoint
    const String apiUrl = 'https://yourapi.com/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'phone_number': phoneNumber,
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful login
        Get.to(HomeScreen());
      }

      else {
        Get.to(HomeScreen());

        // Handle error
        // Get.snackbar('Error', 'Login failed');
      }
    } catch (e) {
      // Handle error
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }
}

// class LoginController extends GetxController {
//   var isLoading = false.obs;
//
//   Future<void> login(String phoneNumber) async {
//     isLoading.value = true;
//
//     // Replace with your API endpoint
//     const String apiUrl = 'https://yourapi.com/login';
//
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{
//           'phone_number': phoneNumber,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         // Handle successful login
//         Get.to(HomeScreen());
//       }
//
//         else {
//         Get.to(HomeScreen());
//
//         // Handle error
//         // Get.snackbar('Error', 'Login failed');
//       }
//     } catch (e) {
//       // Handle error
//       Get.snackbar('Error', 'Something went wrong');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
