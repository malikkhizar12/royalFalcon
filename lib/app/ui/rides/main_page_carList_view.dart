import 'package:flutter/material.dart';

import 'models/main_page_cars_model.dart';

class CarListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<RidePageCar> cars = RidePageCar.getRidesCars();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:  EdgeInsets.all(16.0),
          child: Text(
            'Explore More Popular Cars',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: Image.asset(car.imageUrl, width: 64.0, height: 64.0),
                title: Text(car.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(car.rating, (index) => Icon(Icons.star, color: Colors.orange)),
                    ),
                    Text('${car.baggage} Baggage | ${car.persons} Persons'),
                  ],
                ),
                trailing: Text('${car.price} AED'),
              );
            },
          ),
        ),
      ],
    );
  }
}
