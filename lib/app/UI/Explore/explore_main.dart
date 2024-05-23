import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_falcon_limousine/app/UI/Explore/recommended_card.dart';
import 'package:royal_falcon_limousine/app/controllers/getaway_animation_controller.dart';
import '../../widgets/appbarcustom.dart';
import '../../widgets/searchbar.dart';
import '../GetAway/models/explore_card_model.dart';
import 'most_visited_card.dart';

class ExploreMain extends StatefulWidget {
  ExploreMain({Key? key}) : super(key: key);

  @override
  _ExploreMainState createState() => _ExploreMainState();
}

class _ExploreMainState extends State<ExploreMain> {
  final GetawayAnimationController getawayAnimationController =
      Get.put(GetawayAnimationController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getawayAnimationController.startAnimation();
    });
  }

  @override
  void dispose() {
    getawayAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<ExploreCardModel> exploreCards = [
      ExploreCardModel(
        imageUrl:
            'https://www.frost.com/wp-content/uploads/2018/02/Dubai-Tourism-1080x675.jpg',
        title: 'Mountain View',
        location: 'Switzerland',
      ),
      ExploreCardModel(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRSfiks-mlGyMj_fD3wJmR71Qfnu2rJ3_-ajn3rqb-DC1yuAFuWNjWxM8HbSjqqIHN3TA&usqp=CAU',
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
            const appbarcustom(
              title: 'Explore',
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Find Your Dream Place",
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ElevatedSearchBar(
                    hintText: "Search",
                    fillcolor: Color(0xFFFFBC07),
                    textcolor: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Most Visited",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 239,
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
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Recommended",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 400, // or any other fixed height
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF35383B),
                ),
                child: Obx(() {
                  final myAnimation =
                      getawayAnimationController.myAnimation.value;
                  return ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 400 + (index * 250)),
                        curve: Curves.easeIn,
                        transform: Matrix4.translationValues(
                            myAnimation ? 0 : MediaQuery.of(context).size.width,
                            0,
                            0),
                        child: const RecommendedCard(
                          imageUrl:
                              'https://i2.wp.com/www.alltherooms.com/blog/wp-content/uploads/2018/09/Feature-Beaches-in-the-Maldives-By-Nikolay-007.jpg?fit=1000%2C667&ssl=1',
                          title: 'Beach Trip',
                          price: 'AED 80 / Person',
                          rating: 4.5,
                        ),
                      );
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
