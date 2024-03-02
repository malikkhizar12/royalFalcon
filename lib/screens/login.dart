import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_falcon_limousine/bindings/booking_binding.dart';
import 'package:royal_falcon_limousine/screens/bookings.dart';
import 'package:royal_falcon_limousine/widgets/phone_number_field.dart';

import '../colors.dart';
import 'homescreen.dart';


  class Login extends StatelessWidget {
    const Login({super.key});
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/company_logo.png'),
          
                  // margin: EdgeInsets.only(bottom: 20),
                Image.asset('images/royal_falcon.png'),
                const SizedBox(height: 50,),
          
                Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text('Phone Number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
          
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: const PhoneNumberField(),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 30, top: 10,right: 20,left: 20),
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
                      const Text('Or Sign up with',style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                      const SizedBox(height:30 ,),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1E23
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Handle Google login
                          },
                          icon: Image.asset('images/google_logo.webp',width: 40,height:40,),
                        ),

                      ),
                      const SizedBox(height:30 ,),

                      ElevatedButton(
                        onPressed: () {
                          Get.to(HomeScreen());
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(buttonColor), // Set button background color
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero), // Set padding to zero
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Expand tap target to the size of the button
                          minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 48)), // Set minimum size to full width and 48 height
                        ),
                        child: Container(
                          width: double.infinity, // Ensure button takes up full width
                          height: 48, // Set desired height
                          alignment: Alignment.center,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height:5 ,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
