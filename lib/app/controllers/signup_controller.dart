import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:royal_falcon_limousine/app/UI/login/login.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  final String signupUrl = 'https://royal-falcon-backend.onrender.com/auth/register'; // Replace with your actual signup API URL

  void signup(String name, String email, String phoneNumber, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    if (!_isValidEmail(email)) {
      Get.snackbar('Error', 'Invalid email format');
      return;
    }

    if (!_isValidPhoneNumber(phoneNumber)) {
      Get.snackbar('Error', 'Invalid phone number format');
      return;
    }

    isLoading.value = true;

    try {
      // Create the request payload
      var payload = {
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
      };

      // Make the POST request
      var response = await http.post(
        Uri.parse(signupUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(payload),
      );

      // Check if the signup was successful
      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Signup successful');
        Get.to(() => Login());
      } else {
        var responseData = json.decode(response.body);
        Get.snackbar('Error', responseData['message'] ?? 'Signup failed');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  bool _isValidEmail(String email) {
    String emailPattern = r'^[^@]+@[^@]+\.[^@]+';
    return RegExp(emailPattern).hasMatch(email);
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    String phonePattern = r'^\+\d{1,3}\d{10}$';
    return RegExp(phonePattern).hasMatch(phoneNumber);
  }
}
