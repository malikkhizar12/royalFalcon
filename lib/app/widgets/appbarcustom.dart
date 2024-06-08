import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarCustom extends StatelessWidget {
  final String title;
  const AppbarCustom({

    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              margin: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back, color: Color(0xFFCF9D2C)),
                iconSize: 23,
              ),
            ),
          ),
          const Spacer(flex: 3,),

          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 17.sp),
          ),
          const Spacer(flex: 2,),
          Row(
            children: [
              IconButton(
                onPressed: () {

                },

                icon: Image.asset('images/about_icon.png'),
              ),
              IconButton(
                onPressed: () {

                },

                icon: Image.asset('images/heart_like.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
