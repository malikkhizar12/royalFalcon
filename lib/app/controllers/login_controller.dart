import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:royal_falcon_limousine/app/utils/api_functions.dart';
import 'dart:convert';
import 'package:royal_falcon_limousine/app/ui/home_screen/homescreen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final String loginUrl =
      'https://royal-falcon-backend.onrender.com/auth/login';
  final GetApiFunctions getApiFunctions = GetApiFunctions();

  void login(String email, String password) async {
    isLoading.value = true;

    try {
      var payload = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(payload),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        var responseData = json.decode(response.body);
        String token = responseData['token'];

        // Store the token in SharedPreferences
        bool isTokenSaved = await getApiFunctions.storeToken(token);

        if (isTokenSaved) {
          print('Token saved successfully: $token');

          // Save user data
          await getApiFunctions.saveUserData(responseData['user']);

          Get.snackbar('Success', 'Login successful');
          Get.to(() => const HomeScreen());
        } else {
          print('Failed to save token');
          Get.snackbar('Error', 'Login Failed (token not saved)');
        }
      } else {
        var responseData = json.decode(response.body);
        Get.snackbar('Error', responseData['message'] ?? 'Login failed');
      }
    } catch (e) {
      print('Error during login: $e');
      Get.snackbar(
          'Error', 'An error occurred during login. Please try again later.');
    } finally {
      isLoading.value = false;
    }
  }
}
