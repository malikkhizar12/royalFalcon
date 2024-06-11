import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royal_falcon_limousine/app/utils/api_functions.dart';

import 'app/UI/login/login.dart';
import 'app/ui/home_screen/homescreen.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({super.key});
  GetApiFunctions getApiFunctions=GetApiFunctions();
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize:const Size(430,932),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Royal Falcon Limousine',
        initialRoute: '/',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  AnimatedSplashScreen(
          splash: 'images/splashIcon.png',
          nextScreen:FutureBuilder<bool>(
            future: getApiFunctions.isLoggedIn(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Placeholder widget while checking token
              } else {
                if (snapshot.hasData && snapshot.data == true) {
                  return const HomeScreen(); // Navigate to home screen if token is available
                } else {
                  return const Login(); // Navigate to login screen if token is not available
                }
              }
            },
          ),
          centered: true,
          backgroundColor: Colors.black,
          duration: 3000,
          splashIconSize: 1000,
        )
      ),
    );
  }
}






