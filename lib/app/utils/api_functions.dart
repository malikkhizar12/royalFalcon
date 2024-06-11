import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../UI/login/login.dart';

class GetApiFunctions {
  Future<bool> storeToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('api_token', token);
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', userData['name']);
    await prefs.setString('user_email', userData['email']);
    // Save other user data like image URL, phone number, etc.
  }

  Future<Map<String, String>> _getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }

  void fetchData() async {
    try {
      var headers = await _getHeaders();
      var response = await http.get(
        Uri.parse('https://example.com/api/data'),
        headers: headers,
      );

      if (response.statusCode == 201) {
        print('Data fetched successfully');
        // Handle the response data
      } else {
        print('Failed to fetch data');
        // Handle error response
      }
    } catch (e) {
      print('Error: $e');
      // Handle the error
    }
  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('api_token') != null;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('api_token');
    Get.offAll(const Login());  // Navigate to the login screen
  }
}
