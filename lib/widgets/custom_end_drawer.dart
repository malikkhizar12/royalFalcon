// CustomDrawer code

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(bool) toggleDrawer;

  const CustomDrawer({
    Key? key,
    required this.toggleDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleDrawer(false); // Close drawer when tapped outside
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(
          MediaQuery.of(context).size.width * 0.2, // Adjust as needed
          0,
          0,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Center(
            child:                 Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: SizedBox(
                width: 273,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    // Get.to(HomeScreen());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent), // Set transparent background color
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 48)),
                    shadowColor: MaterialStateProperty.all<Color>(
                        const Color(0x613EEA52)), // Set shadow color
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFB17C0F),
                          Color(0xFF000000),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      child: const Text(
                        'Get 10% discount on your first ride',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }
}
