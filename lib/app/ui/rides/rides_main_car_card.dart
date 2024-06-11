import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_falcon_limousine/app/widgets/starRating.dart';

class RidesMainCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final int baggage;
  final int persons;
  final double rating;

  const RidesMainCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.baggage,
    required this.persons,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.45.sw, // Adjusted for two columns in a row
      margin: EdgeInsets.all(8.0.w),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF35383B),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFFFFBC07),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "$baggage Baggages",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "$persons Persons",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height:6.h),
                    StarRating(rating: rating),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Starting From",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "$price AED",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 10.h),
                    // Center(
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       // Add your booking action here
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: const Color(0xFFFFBC07),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20.0),
                    //       ),
                    //       padding: EdgeInsets.symmetric(
                    //         horizontal: 40.w,
                    //         vertical: 10.h,
                    //       ),
                    //     ),
                    //     child: const Text(
                    //       'Book Now',
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
