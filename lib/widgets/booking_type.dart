import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingType extends StatelessWidget {
  const BookingType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF514A3C)),
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF22272B)
      ),
      child: Column(
        children: [
          Image.asset('images/home_icon.png'),
          SizedBox(height: 20.h,),
          SizedBox(
            width: 283.w,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFCF9D2C))
              ),
                onPressed: (){},
                child: Text("Normal Booking",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                ),
                )
            ),
          ),
          SizedBox(height: 15.h,),
          SizedBox(
            width: 283.w,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFC9C9C9))
              ),
                onPressed: (){},
                child: Text("Airport Booking",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
