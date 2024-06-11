import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royal_falcon_limousine/app/UI/login/login.dart';
import '../../controllers/signup_controller.dart';
import '../../utils/colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupController signupController = Get.put(SignupController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String selectedCountryCode = '+92';
  String? phoneNumberError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Column(
                  children: [
                    Image.asset('images/company_logo.png', height: 80),
                    Image.asset('images/royal_falcon.png', height: 40),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              _buildTextField('Full Name', nameController, TextInputType.text),
              SizedBox(height: 20.h),
              _buildTextField('Email Address', emailController, TextInputType.emailAddress),
              SizedBox(height: 20.h),
              _buildPhoneNumberField('Phone Number', phoneController),
              if (phoneNumberError != null)
                Text(
                  phoneNumberError!,
                  style: TextStyle(color: Colors.red, fontSize: 14.sp),
                ),
              SizedBox(height: 20.h),
              _buildTextField('Password', passwordController, TextInputType.visiblePassword, obscureText: true),
              SizedBox(height: 20.h),
              _buildTextField('Confirm Password', confirmPasswordController, TextInputType.visiblePassword, obscureText: true),
              SizedBox(height: 35.h),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: signupController.isLoading.value
                          ? null
                          : () {
                        if (_validatePhoneNumber()) {
                          final fullPhoneNumber = '$selectedCountryCode${phoneController.text}';
                          signupController.signup(
                            nameController.text,
                            emailController.text,
                            fullPhoneNumber,
                            passwordController.text,
                            confirmPasswordController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD700), // Button color
                        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 100.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: signupController.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 40.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Have An Account? ',
                    style: const TextStyle(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Get.to(() => const Login());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, TextInputType keyboardType, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        SizedBox(height: 5.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1A1E23),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 0.7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: -5,
                blurRadius: 10,
                offset: const Offset(-3, -3),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: -5,
                blurRadius: 10,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        SizedBox(height: 5.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1A1E23),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 0.7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: -5,
                blurRadius: 10,
                offset: const Offset(-3, -3),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: -5,
                blurRadius: 10,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: DropdownButton<String>(
                  dropdownColor: Colors.black,
                  value: selectedCountryCode,
                  items: <String>['+92', '+971', '+44'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCountryCode = newValue!;
                    });
                  },
                  underline: const SizedBox(),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onChanged: (value) {
                    if (value.length > 10) {
                      setState(() {
                        phoneNumberError = 'Phone number cannot exceed 10 digits';
                      });
                    } else {
                      setState(() {
                        phoneNumberError = null;
                      });
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _validatePhoneNumber() {
    if (phoneController.text.length > 10) {
      setState(() {
        phoneNumberError = 'Phone number cannot exceed 10 digits';
      });
      return false;
    }
    return true;
  }
}
