import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_falcon_limousine/app/UI/Explore/recommended_card.dart';
import '../../widgets/appbarcustom.dart';
import '../../widgets/searchbar.dart';
import '../GetAway/models/explore_card_model.dart';
import 'most_visited_card.dart';


class ExploreMain extends StatelessWidget {
  ExploreMain({super.key});
  @override
  Widget build(BuildContext context) {
    final List<ExploreCardModel> exploreCards = [
      ExploreCardModel(
        imageUrl: 'https://www.frost.com/wp-content/uploads/2018/02/Dubai-Tourism-1080x675.jpg',
        title: 'Mountain View',
        location: 'Switzerland',
      ),
      ExploreCardModel(
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRSfiks-mlGyMj_fD3wJmR71Qfnu2rJ3_-ajn3rqb-DC1yuAFuWNjWxM8HbSjqqIHN3TA&usqp=CAU',
        title: 'Beautiful Beach',
        location: 'Maldives',
      ),

      // Add more ExploreCardModel instances as needed
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF22272B),
        body: ListView(
          children: [
            const appbarcustom(title: 'Explore',),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find Your Dream Place",
                    style: TextStyle(color: Colors.white, fontSize: 26.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ElevatedSearchBar(
                    hintText: "Search",
                    fillcolor: Color(0xFFFFBC07),
                    textcolor: Colors.white,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Most Visited",
                      style: TextStyle(color: Colors.white, fontSize: 22.sp),
                    ),
                  ),
                  SizedBox(
                    height: 239.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: exploreCards.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MostVisitedCard(
                          exploreCard: exploreCards[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Text(
                      "Recommended",
                      style: TextStyle(color: Colors.white, fontSize: 22.sp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 400, // or any other fixed height
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF35383B),
                ),
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, index) {
                      return const RecommendedCard(
                        imageUrl: 'https://i2.wp.com/www.alltherooms.com/blog/wp-content/uploads/2018/09/Feature-Beaches-in-the-Maldives-By-Nikolay-007.jpg?fit=1000%2C667&ssl=1',
                        title: 'Beach Trip',
                        price: 'AED 80 / Person',
                        rating: 4.5,
                      );

                    }
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
