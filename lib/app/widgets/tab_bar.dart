import 'package:flutter/material.dart';

import '../controllers/explore_most_visited_controller.dart';
import '../controllers/explore_now_controller.dart';

class TabBarContent<T> extends StatelessWidget {
  final TabController tabController;
  final double tabBarViewHeight;
  final double availableHeight;
  final List<T> images;

  const TabBarContent({
    Key? key,
    required this.tabController,
    required this.tabBarViewHeight,
    required this.availableHeight,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tabBarViewHeight,
      child: TabBarView(
        controller: tabController,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Dubai safari park is the new and updated version of Dubai zoo "
                  "which now offers you the luxury of exploring and discovering up "
                  "close about 3000 animals of over 250 species from across the world in "
                  "an ecofriendly and safe environment where the animals are kept in an "
                  "open undisturbed habitat in a 119 acres facility.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              height: availableHeight,
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  if (T == ImageModel) {
                    // Handle ImageModel
                    final imageModel = images[index] as ImageModel;
                    return Image.asset(
                      imageModel.imageUrl,
                      fit: BoxFit.cover,
                    );
                  } else if (T == MostVisitedImageModel) {
                    // Handle MostVisitedImageModel
                    final mostVisitedImageModel = images[index] as MostVisitedImageModel;
                    return Image.asset(
                      mostVisitedImageModel.imageUrl,
                      fit: BoxFit.cover,
                    );
                  } else {
                    // Handle other types of images
                    return Container(); // Placeholder
                  }
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "1. Swimming Pool\n2. Jeep rally\n 3. Travel Insurance\n 4. Accomodation\n 5. Health and wellness\n 6. Pick and Drop",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

