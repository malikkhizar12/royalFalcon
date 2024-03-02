import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:royal_falcon_limousine/colors.dart';
import 'package:royal_falcon_limousine/controllers/booking_list_controller.dart';
import 'package:royal_falcon_limousine/widgets/searchbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../screens/booking_form.dart';

import '../widgets/appbar.dart';

class BookingsList extends StatelessWidget {
  const BookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingListController bookingListController =
    Get.put(BookingListController());
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: const CustomAppBar(title: 'Booking'),
      body: GetBuilder<BookingListController>(
        builder: (controller) {
          if (controller.isLoading.value==true) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xFFCF9D2C),),
            );
          } else {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                      crossAxisCount: 2,
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
                                AspectRatio(
                                  aspectRatio: 166 / 140,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      item['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
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
                                Flexible(
                                  child: Text(
                                    '${item['rating']['rate']}/5',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
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
                                    const Text(
                                      'From',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'AED ${item['price']}',
                                      style: const TextStyle(
                                        color: Color(0xFFCF9D2C),
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Text(
                                      ' / Person',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(const BookingForm());
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xFFCF9D2C)),
                                    padding:
                                    MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        EdgeInsets.zero),
                                    tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    minimumSize:
                                    MaterialStateProperty.all<Size>(
                                        const Size(double.infinity, 10)),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4),
                                    child: Text(
                                      'Book Now',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
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
