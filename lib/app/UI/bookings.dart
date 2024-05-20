import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../controllers/booking_list_controller.dart';
import 'booking_form.dart';
import '../widgets/appbar.dart';
import '../widgets/searchbar.dart';
import 'package:royal_falcon_limousine/app/utils/colors.dart';

class BookingsList extends StatelessWidget {
  const BookingsList({Key? key});

  @override
  Widget build(BuildContext context) {
    final BookingListController bookingListController =
    Get.put(BookingListController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GetBuilder<BookingListController>(
        builder: (controller) {
          if (controller.isLoading.value == true) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xFFCF9D2C),
              ),
            );
          } else {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: CustomAppBar(title: 'Booking'),
                  ),
                  const ElevatedSearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 28,
                      padding: const EdgeInsets.all(12),
                      childAspectRatio: 2 / 3.5,
                      children: List.generate(
                        controller.jsonDataList.length,
                            (index) {
                          final item = controller.jsonDataList[index];
                          return Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: cardBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      item['image'],
                                      fit: BoxFit.cover,
                                      height: 250,
                                      width: 150,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                RatingBar.builder(
                                  initialRating: (item['rating'] != null &&
                                      item['rating']['rate'] is num)
                                      ? double.parse(
                                      item['rating']['rate'].toString())
                                      : 0.0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 17,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${item['rating']['rate']}/5',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${item['rating']['count']} Reviews',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                        'From ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                      ),

                                     Text(
                                        'AED${item['price']}',
                                        style: const TextStyle(
                                          color: Color(0xFFCF9D2C),
                                          fontSize: 10,
                                        ),
                                      ),

                                    Text(
                                        ' / Person',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                      ),

                                  ],
                                ),

                                const SizedBox(height: 5),
                                Center(
                                  child: SizedBox(
                                    height: 30,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.to(const BookingForm());
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFFCF9D2C)),
                                        padding:
                                        MaterialStateProperty.all<EdgeInsetsGeometry>(
                                            const EdgeInsets.symmetric(vertical: 2, horizontal: 40)),
                                      ),
                                      child: const Text(
                                        'Book Now',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
