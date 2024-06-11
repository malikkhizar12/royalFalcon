import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../controllers/login_controller.dart';
import '../signup/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/company_logo.png'),
                  Image.asset('images/royal_falcon.png'),
                  SizedBox(height: 50.h,),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color(0xFF1A1E23),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 20.w, top: 10.h),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color(0xFF1A1E23),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 30.h, top: 10.h, right: 20.w, left: 20.w),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      color: Color(0xFF0E1115), // Even darker color
                    ),
                    child: Column(
                      children: [
                        const Text('Or Sign up with', style: TextStyle(color: Colors.white)),
                        SizedBox(height: 30.h,),
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1E23),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Handle Google login
                            },
                            icon: Image.asset('images/google_logo.webp', width: 40.w, height: 40.h),
                          ),
                        ),
                        SizedBox(height: 30.h,),
                        Obx(() {
                          return ElevatedButton(
                            onPressed: loginController.isLoading.value
                                ? null
                                : () {
                              loginController.login(emailController.text, passwordController.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(buttonColor), // Set button background color
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero), // Set padding to zero
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Expand tap target to the size of the button
                              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 48)), // Set minimum size to full width and 48 height
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13), // Set corner radius to 13
                                ),
                              ),
                            ),
                            child: loginController.isLoading.value
                                ? CircularProgressIndicator(color: Colors.white)
                                : Container(
                              width: double.infinity, // Ensure button takes up full width
                              height: 48.h, // Set desired height
                              alignment: Alignment.center,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 5.h,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 50.h,
            right: 20.w,
            child: RichText(
              text: TextSpan(
                text: 'Signup ',
                style: const TextStyle(color: Colors.grey),
                recognizer: TapGestureRecognizer()..onTap = () {
                  Get.to(() => SignupPage());
                },

              ),
            ),
          ),
        ],
      ),
    );
  }
}
