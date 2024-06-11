
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royal_falcon_limousine/app/UI/Rides/airport_bookings.dart';
import 'package:royal_falcon_limousine/app/ui/rides/normal_bookings.dart';


class BookingType extends StatelessWidget {
  const BookingType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,

      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(color:const Color(0xFF514A3C)),
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF22272B)
      ),
      child: Column(
        children: [
          Image.asset('images/home_icon.png'),
          SizedBox(height: 20.h,),
          SizedBox(
            width: 283.w,

            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFCF9D2C))
              ),
                onPressed: (){
                  Get.to(
                          ()=>const NormalBookings()
                  );
                },
                child: const Text("Normal Booking",
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
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFC9C9C9))
              ),
                onPressed: (){
                  Get.to(
                      ()=> AirportBookings()
                  );
                },
                child: const Text("Airport Booking",
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
