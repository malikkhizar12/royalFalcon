class RidePageCar {
  final String name;
  final String imageUrl;
  final double price;
  final int baggage;
  final int persons;
  final int rating;

  RidePageCar({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.baggage,
    required this.persons,
    required this.rating,
  });


  static List<RidePageCar> getRidesCars() {
    return [
      RidePageCar(
        name: 'Lexus ES 300H',
        imageUrl: 'assets/images/lexus.png',
        price: 100,
        baggage: 3,
        persons: 4,
        rating: 5,
      ),
      RidePageCar(
        name: 'Mercedes Benz S Class',
        imageUrl: 'assets/images/mercedes.png',
        price: 225,
        baggage: 3,
        persons: 4,
        rating: 5,
      ),
      RidePageCar(
        name: 'Chevrolet Malibu',
        imageUrl: 'assets/images/chevrolet.png',
        price: 225,
        baggage: 3,
        persons: 4,
        rating: 5,
      ),
    ];
  }
}
